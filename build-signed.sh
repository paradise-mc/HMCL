#!/usr/bin/env sh
set -eu

GENERATE_KEY=0
DERIVE_PUBLIC_KEY=0

while [ "$#" -gt 0 ]; do
    case "$1" in
        --generate-key|-g)
            GENERATE_KEY=1
            shift
            ;;
        --derive-public-key|-d)
            DERIVE_PUBLIC_KEY=1
            shift
            ;;
        --)
            shift
            break
            ;;
        *)
            break
            ;;
    esac
done

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
PRIVATE_KEY="$SCRIPT_DIR/hmcl_signature_privatekey.der"
PUBLIC_KEY="$SCRIPT_DIR/HMCL/src/main/resources/assets/hmcl_signature_publickey.der"
SIGNATURE_ALGORITHM="RSA"

if [ -z "${JAVA_HOME:-}" ] && [ -x "/c/Program Files/Java/jdk-17/bin/java.exe" ]; then
    JAVA_HOME="/c/Program Files/Java/jdk-17"
    export JAVA_HOME
    PATH="$JAVA_HOME/bin:$PATH"
    export PATH
fi

JAVA_EXE="${JAVA_HOME:+$JAVA_HOME/bin/java}"
JAVAC_EXE="${JAVA_HOME:+$JAVA_HOME/bin/javac}"
JAVA_EXE="${JAVA_EXE:-java}"
JAVAC_EXE="${JAVAC_EXE:-javac}"

invoke_key_tool() {
    WORK_DIR="${TMPDIR:-/tmp}/hmcl-signing-key-tool-$$-$RANDOM"
    mkdir -p "$WORK_DIR"
    SOURCE_PATH="$WORK_DIR/HmclSigningKeyTool.java"

    cat > "$SOURCE_PATH" <<'JAVA'
import java.nio.file.Files;
import java.nio.file.Path;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.interfaces.RSAPrivateCrtKey;
import java.security.spec.RSAPublicKeySpec;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;

public final class HmclSigningKeyTool {
    public static void main(String[] args) throws Exception {
        String mode = args[0];
        String algorithm = args[1];
        Path privateKey = Path.of(args[2]);
        Path publicKey = Path.of(args[3]);

        if ("generate".equals(mode)) {
            KeyPairGenerator generator = KeyPairGenerator.getInstance(algorithm);
            generator.initialize(4096);
            KeyPair keyPair = generator.generateKeyPair();
            Files.write(privateKey, keyPair.getPrivate().getEncoded());
            Files.createDirectories(publicKey.getParent());
            Files.write(publicKey, keyPair.getPublic().getEncoded());
            return;
        }

        KeyFactory keyFactory = KeyFactory.getInstance(algorithm);
        var loadedPrivateKey = keyFactory.generatePrivate(new PKCS8EncodedKeySpec(Files.readAllBytes(privateKey)));

        if ("derive-public".equals(mode)) {
            RSAPrivateCrtKey rsaPrivateKey = (RSAPrivateCrtKey) loadedPrivateKey;
            var rsaPublicKey = keyFactory.generatePublic(new RSAPublicKeySpec(
                    rsaPrivateKey.getModulus(),
                    rsaPrivateKey.getPublicExponent()));
            Files.createDirectories(publicKey.getParent());
            Files.write(publicKey, rsaPublicKey.getEncoded());
            return;
        }

        keyFactory.generatePublic(new X509EncodedKeySpec(Files.readAllBytes(publicKey)));
    }
}
JAVA

    "$JAVAC_EXE" "$SOURCE_PATH"
    "$JAVA_EXE" -cp "$WORK_DIR" HmclSigningKeyTool "$@"
    rm -rf "$WORK_DIR"
}

if [ "$GENERATE_KEY" -eq 1 ]; then
    TIMESTAMP=$(date +%Y%m%d%H%M%S)
    if [ -f "$PRIVATE_KEY" ]; then
        cp "$PRIVATE_KEY" "$PRIVATE_KEY.bak-$TIMESTAMP"
    fi
    invoke_key_tool generate "$SIGNATURE_ALGORITHM" "$PRIVATE_KEY" "$PUBLIC_KEY"
fi

if [ "$DERIVE_PUBLIC_KEY" -eq 1 ]; then
    invoke_key_tool derive-public "$SIGNATURE_ALGORITHM" "$PRIVATE_KEY" "$PUBLIC_KEY"
fi

if [ ! -f "$PRIVATE_KEY" ]; then
    echo "Missing signing private key: $PRIVATE_KEY. Run ./build-signed.sh --generate-key first." >&2
    exit 1
fi

if [ ! -f "$PUBLIC_KEY" ]; then
    echo "Missing signing public key resource: $PUBLIC_KEY. Run ./build-signed.sh --generate-key first." >&2
    exit 1
fi

if ! invoke_key_tool validate "$SIGNATURE_ALGORITHM" "$PRIVATE_KEY" "$PUBLIC_KEY"; then
    echo "Signing keys are not valid $SIGNATURE_ALGORITHM keys. Run ./build-signed.sh --generate-key to regenerate matching keys." >&2
    exit 1
fi

export HMCL_SIGNATURE_KEY="$PRIVATE_KEY"

if [ "$#" -eq 0 ]; then
    set -- clean build
fi

cd "$SCRIPT_DIR"
if [ -x "./gradlew" ]; then
    ./gradlew -g .gradle-user-home "$@"
else
    ./gradlew.bat -g .gradle-user-home "$@"
fi
