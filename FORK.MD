# 椛鸟风月 Fork 维护记录

## Fork 标识

- 产品名：椛鸟风月
- Fork 版本：由 `config/project.properties` 的 `forkVersion` 配置
- Fork 版本配置：`config/project.properties` 的 `forkVersion`
- Fork 版本字段：`Metadata.FORK_VERSION`，运行时读取 `hmcl.fork.version`
- 构建产物命名：`PARADISE-(Fork Version).*`
- 更新下载前缀：`config/project.properties` 的 `forkUpdateDownloadBaseUrl`
- 上游 HMCL 版本字段：`Metadata.VERSION`
- 用户可见标题：`Metadata.FORK_TITLE`
- 官网：<https://paradise.mahoutsukai.cn>
- QQ 群：<https://qm.qq.com/q/8csd09LJWE>
- 黑盒语音：<https://chat.xiaoheihe.cn/i9ek1o>

## 上游基线

- 本地分支：`main`
- 跟踪分支：`hmcl/main`
- 上游远端：`hmcl git@ssh.github.com:HMCL-dev/HMCL.git`
- Fork 远端：`origin git@ssh.github.com:tiltysola/HMCL.git`
- 当前上游提交：`afbf567fef0cd4b0cc714297600b73766d5cf257`
- 提交作者：CiiLu
- 提交时间：2026-05-09 21:26:06 +0800
- 提交标题：缓解离线皮肤 CSL 输入框打一个字弹窗一个 toast “操作失败” 问题 (#5789)

## Fork 改动

- 内置 authlib-injector 登录源 `椛鸟风月`，API 根地址为 `https://paradise.mahoutsukai.cn/api/paradise/yggdrasil/`。
- 添加账户列表中，内置 `椛鸟风月` 只显示名称，不显示 API 地址、主机名或包含 API 地址的提示。
- 内置 `椛鸟风月` 登录源不可删除；用户自定义 authlib-injector 登录源仍可删除。
- 移除 LittleSkin 默认源状态字段 `addedLittleSkin` 及其主动使用，Paradise 内置源不再依赖 LittleSkin 迁移标记。
- 启动器用户可见名称改为 `椛鸟风月 (Fork Version)`，同时保留上游 HMCL 版本信息用于诊断、更新逻辑和维护记录。
- 构建产物文件名改为 `PARADISE-(Fork Version)`，派生的 `.exe`、`.sh`、`.deb` 和校验文件沿用同一前缀。
- 构建时在 jar 输出目录生成 `distribution.json` 更新描述文件，可通过 `https://cdn.tiltysola.com/distro/hmcl/distribution.json` 分发；默认 jar 下载地址格式为 `https://cdn.tiltysola.com/distro/hmcl/PARADISE-(Fork Version).jar`。
- 签名构建使用仓库根目录的 `build-signed.sh`，脚本读取本地私钥 `hmcl_signature_privatekey.der` 并设置 `HMCL_SIGNATURE_KEY` 后执行 Gradle；私钥文件已在 `.gitignore` 中忽略，不能提交到仓库。
- 启动器默认更新源改为 `https://cdn.tiltysola.com/distro/hmcl/distribution.json`；`hmcl.update_source.override` 仍可在本地测试时覆盖。
- Fork 更新检查使用 `Metadata.FORK_VERSION` 和 `distribution.json` 中的 `version` 比较，不再使用上游 `Metadata.VERSION`；更新请求里的 `version` 参数也传 fork 版本。
- 更新弹窗保留上游 HTML 更新日志解析逻辑，但更新日志地址固定为 `https://cdn.tiltysola.com/distro/hmcl/changelog.html`，不再指向 HMCL 官方更新日志页面。
- 仓库根目录的 `changelog.html` 是 CDN 更新日志源文件，需上传到 `https://cdn.tiltysola.com/distro/hmcl/changelog.html`；版本标题必须使用 `h1 data-version="(Fork Version)"`，以匹配启动器更新弹窗解析逻辑。
- 应用更新时支持把当前 `PARADISE-(Fork Version).exe` 重命名为新 fork 版本文件名。
- 更新设置中的通道选择固定为稳定版，启动时自动检查也使用 `stable` 通道；“提前预览 HMCL 版本”选项已从设置页移除，检查更新始终不请求 preview；“不自动显示更新弹窗”只影响新版本提示弹窗，不影响后台检查、右上角更新气泡或 `distribution.json` 中的 jar 下载地址。
- 移除主界面的 nightly/dev 预览提示卡片。
- 移除账号登录流程里的非官方 HMCL 警告；微软 OAuth 未配置时显示中性的配置提示。
- 移除标准窗口装饰右上角问号帮助按钮。
- 应用程序图标、macOS Dock 图标、文档展示图标和主界面左上角标题图标均替换为椛鸟风月图标。
- 左侧“通用”区域移除官方群组入口，改为打开椛鸟风月官方网站。
- 设置的反馈页顶部新增 `椛鸟风月` 区块，包含官方网站、QQ 群和黑盒语音入口。
- 反馈页椛鸟风月 QQ 群和黑盒语音入口使用 fork 专用 PNG 图标，不再复用通用聊天/反馈 SVG。
- 关于页顶部新增椛鸟风月信息和 fork 版本；上游 HMCL 信息保留在其后。
- 关于页鸣谢顶部新增 `缇尔蒂`，链接到 <https://www.tiltysola.com>。
- 新版本设置默认游戏窗口分辨率改为 `1280x720`，已有配置中的分辨率不受影响。
- 默认启动器背景替换为本地 ATM10 截图，经典背景 `background-classic.jpg` 保留为上游默认备选。

## 资源文件

- `HMCL/src/main/resources/assets/img/background.jpg`
  - 来源：`E:\BoP-ATM10\.minecraft\versions\All the Mods 10\screenshots\2026-05-13_20.54.09.png`
  - 打包尺寸：1600x900
  - 用途：启动器默认背景，保留 16:9 画面以匹配现有背景资源和运行时 cover 显示逻辑。
- `HMCL/src/main/resources/assets/img/icon-title.png`
  - 来源：<https://cdn.tiltysola.com/assets/tilty/images/tilty_qq_smile.png>
  - 打包尺寸：24x24
  - 用途：主界面左上角标题图标。
- `HMCL/src/main/resources/assets/img/icon-title@2x.png`
  - 来源：<https://cdn.tiltysola.com/assets/tilty/images/tilty_qq_smile.png>
  - 打包尺寸：48x48
  - 用途：主界面左上角标题图标的高分辨率资源。
- `HMCL/src/main/resources/assets/img/icon.png`
  - 来源：<https://cdn.tiltysola.com/assets/tilty/images/tilty_qq_smile.png>
  - 打包尺寸：32x32
  - 用途：默认应用图标和界面内默认图标。
- `HMCL/src/main/resources/assets/img/icon@2x.png`
  - 来源：<https://cdn.tiltysola.com/assets/tilty/images/tilty_qq_smile.png>
  - 打包尺寸：64x64
  - 用途：默认应用图标的高分辨率资源。
- `HMCL/src/main/resources/assets/img/icon@4x.png`
  - 来源：<https://cdn.tiltysola.com/assets/tilty/images/tilty_qq_smile.png>
  - 打包尺寸：128x128
  - 用途：Windows/Linux 窗口图标和部分大图标 UI。
- `HMCL/src/main/resources/assets/img/icon@8x.png`
  - 来源：<https://cdn.tiltysola.com/assets/tilty/images/tilty_qq_smile.png>
  - 打包尺寸：256x256
  - 用途：文档展示图标和更高分辨率应用图标资源。
- `HMCL/src/main/resources/assets/img/icon-mac.png`
  - 来源：<https://cdn.tiltysola.com/assets/tilty/images/tilty_qq_smile.png>
  - 打包尺寸：512x512
  - 用途：macOS Dock 图标。
- `HMCL/src/main/resources/assets/img/paradise.png`
  - 来源：<https://cdn.tiltysola.com/assets/tilty/images/tilty_qq_smile.png>
  - 打包尺寸：32x32
  - 用途：反馈页和关于页的椛鸟风月图标。
- `HMCL/src/main/resources/assets/img/paradise@2x.png`
  - 来源：<https://cdn.tiltysola.com/assets/tilty/images/tilty_qq_smile.png>
  - 打包尺寸：64x64
  - 用途：椛鸟风月图标的高分辨率资源。
- `HMCL/src/main/resources/assets/img/paradise-qq.png`
  - 来源：仓库根目录 `QQ_256x256_32bit.png`
  - 打包尺寸：256x256
  - 用途：反馈页椛鸟风月 QQ 群入口图标，界面中按 32x32 显示。
- `HMCL/src/main/resources/assets/img/paradise-heybox.png`
  - 来源：仓库根目录 `HeyboxChat_256x256_32bit.png`
  - 打包尺寸：256x256
  - 用途：反馈页椛鸟风月黑盒语音入口图标，界面中按 32x32 显示。
- `HMCL/src/main/resources/assets/img/tiltysola.png`
  - 来源：<https://cdn.tiltysola.com/uploads/tilty/gallery/18e5f0d5d4a84124934dcc68b4b085ac/18e5f0d5d4a84124934dcc68b4b085ac.webp>
  - 打包尺寸：32x32
  - 用途：关于页鸣谢头像，避免依赖 JavaFX 对 WebP 的运行时支持。
- `HMCL/src/main/resources/assets/img/tiltysola@2x.png`
  - 来源：<https://cdn.tiltysola.com/uploads/tilty/gallery/18e5f0d5d4a84124934dcc68b4b085ac/18e5f0d5d4a84124934dcc68b4b085ac.webp>
  - 打包尺寸：64x64
  - 用途：缇尔蒂头像的高分辨率资源。

## 维护入口

- 维护规则：任何影响 fork 行为、品牌、默认值、资源、链接、提示、构建元数据或维护流程的仓库改动，都需要同步更新本文件，避免合并上游时丢失改动记录。
- Fork 版本和构建文件名前缀：`config/project.properties`
- 签名构建入口：`build-signed.sh`
- 构建产物命名、`hmcl.fork.version` 生成和更新 JSON 生成：`HMCL/build.gradle.kts`
- 品牌、版本和链接常量：`HMCL/src/main/java/org/jackhuang/hmcl/Metadata.java`
- 更新源默认值和 `hmcl.update_source.override` 覆盖入口：`HMCL/src/main/java/org/jackhuang/hmcl/Metadata.java`
- 更新设置项、稳定版通道固定、fork 版本比较和更新应用重命名：`HMCL/src/main/java/org/jackhuang/hmcl/ui/main/SettingsPage.java`、`HMCL/src/main/java/org/jackhuang/hmcl/upgrade/UpdateChecker.java`、`HMCL/src/main/java/org/jackhuang/hmcl/upgrade/UpdateHandler.java`
- 内置登录源常量和判定：`HMCL/src/main/java/org/jackhuang/hmcl/setting/Accounts.java`
- 添加账户列表展示和删除按钮：`HMCL/src/main/java/org/jackhuang/hmcl/ui/account/AccountListPage.java`
- 登录源选择展示：`HMCL/src/main/java/org/jackhuang/hmcl/ui/account/CreateAccountPane.java`
- 反馈页链接：`HMCL/src/main/java/org/jackhuang/hmcl/ui/main/FeedbackPage.java`
- 关于页展示：`HMCL/src/main/java/org/jackhuang/hmcl/ui/main/AboutPage.java`
- 默认分辨率：`HMCL/src/main/java/org/jackhuang/hmcl/setting/VersionSetting.java`
- 默认背景：`HMCL/src/main/resources/assets/img/background.jpg`
- 文案：`HMCL/src/main/resources/assets/lang/I18N.properties` 和 `HMCL/src/main/resources/assets/lang/I18N_zh_CN.properties`

Gradle 验证命令应使用工作区内缓存目录：

```powershell
.\gradlew -g .gradle-user-home :HMCL:compileJava
```
