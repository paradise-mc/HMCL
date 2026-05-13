## Why

The fork needs first-class Paradise identity instead of surfacing upstream HMCL defaults, community links, and removable authentication sources. These changes make the launcher present as 椛鸟风月 while preserving HMCL upstream version tracking for future maintenance.

## What Changes

- Make the 椛鸟风月 Yggdrasil login source built in, visible by name only under Add Account, and not removable by users.
- Remove obsolete LittleSkin migration/default code and any remaining delete affordance for the built-in 椛鸟风月 source.
- Remove preview/non-official HMCL warnings and the top-right help question mark entry point.
- Rename the launcher display name to 椛鸟风月 and add an independent configured fork version field, separate from the upstream HMCL version.
- Replace official group/community exposure in General settings with a Paradise official website link.
- Add a 椛鸟风月 tab under Settings/Feedback containing links for official website, QQ group, and 黑盒语音.
- Add 椛鸟风月 and its fork version at the top of About, and add 缇尔蒂 to thanks at the top, with the requested outbound links.
- Change the default game window resolution from `854x480` to `1280x720`.
- Add `FORK.MD` documenting all fork changes and current `hmcl/main` branch/base information for maintenance.
- Use the provided 椛鸟风月 PNG and 缇尔蒂 avatar as fork assets where those screens need imagery.

## Capabilities

### New Capabilities
- `paradise-auth-source`: Built-in Paradise Yggdrasil source behavior, display, and deletion constraints.
- `paradise-branding`: Launcher name, fork version, warnings/help removal, settings/feedback/about links, and fork visual assets.
- `paradise-defaults`: Fork-specific runtime defaults such as initial game resolution.
- `fork-maintenance-doc`: Maintenance documentation for fork changes and upstream branch state.

### Modified Capabilities

## Impact

- Affected Java UI and settings code under `HMCL/src/main/java/org/jackhuang/hmcl`.
- Affected i18n resources under `HMCL/src/main/resources/assets/lang`.
- Affected Gradle/build metadata where launcher and fork version fields are produced.
- Adds or updates resource assets under `HMCL/src/main/resources/assets`.
- Adds `FORK.MD` at the repository root.
