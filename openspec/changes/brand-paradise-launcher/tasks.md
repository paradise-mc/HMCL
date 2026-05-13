## 1. Resolve Constants And Existing Fork State

- [x] 1.1 Confirm whether the official website URL should be `https://paradise..mahoutsukai.cn` or corrected to `https://paradise.mahoutsukai.cn`.
- [x] 1.2 Record current `hmcl/main` remote, branch, and commit with `git status --branch`, `git remote -v`, and `git log -1 hmcl/main`.
- [x] 1.3 Decide final local asset filenames for the Paradise PNG and 缇尔蒂 avatar.

## 2. Built-in Paradise Auth Source

- [x] 2.1 Replace active LittleSkin default insertion with unconditional restoration of the built-in Paradise auth source.
- [x] 2.2 Remove `addedLittleSkin` config field, accessors, and remaining active references if no longer needed.
- [x] 2.3 Add a single source of truth for the Paradise auth source URL and display name.
- [x] 2.4 Update Add Account rendering so the built-in `椛鸟风月` option shows no API URL in title, subtitle, or tooltip.
- [x] 2.5 Keep delete/remove actions for custom authlib-injector sources while hiding them for the built-in Paradise source.

## 3. Fork Branding And Versioning

- [x] 3.1 Add fork identity metadata for display name `椛鸟风月` and the configured fork version.
- [x] 3.2 Keep upstream HMCL version metadata available separately for diagnostics, logs, and `FORK.MD`.
- [x] 3.3 Update main window title, main page title, and user-facing launcher identity surfaces to use Paradise branding.
- [x] 3.4 Remove preview/nightly/dev announcement behavior from the main page for normal fork builds.
- [x] 3.5 Remove unofficial HMCL and third-party HMCL warning banners from account login flows.
- [x] 3.6 Remove the top-right question mark/help button from the standard launcher decorator.

## 4. Links, Feedback, And About UI

- [x] 4.1 Replace the General settings official group/community entry with a Paradise official website entry.
- [x] 4.2 Add a `椛鸟风月` section or tab in the Feedback area with official website, QQ group, and 黑盒语音 links.
- [x] 4.3 Add Paradise fork information at the top of About, including fork version.
- [x] 4.4 Add `缇尔蒂` at the top of About acknowledgements with link `https://www.tiltysola.com`.
- [x] 4.5 Update Simplified Chinese and default English i18n keys for new/changed visible strings.

## 5. Assets

- [x] 5.1 Download and add the Paradise PNG from `https://cdn.tiltysola.com/assets/tilty/images/tilty_qq_smile.png`.
- [x] 5.2 Download and add the 缇尔蒂 avatar from `https://cdn.tiltysola.com/uploads/tilty/gallery/18e5f0d5d4a84124934dcc68b4b085ac/18e5f0d5d4a84124934dcc68b4b085ac.webp`.
- [x] 5.3 Reference bundled assets from About or branded UI instead of remote URLs.

## 6. Defaults And Documentation

- [x] 6.1 Change default game width from `854` to `1280` in `VersionSetting`.
- [x] 6.2 Change default game height from `480` to `720` in `VersionSetting`.
- [x] 6.3 Add `FORK.MD` summarizing all fork changes, upstream `hmcl/main` base, fork version, links, and bundled asset sources.

## 7. Verification

- [x] 7.1 Run `git diff --check`.
- [x] 7.2 Run `.\gradlew -g .gradle-user-home :HMCL:compileJava` with JDK 22 or another Java 17+ runtime.
- [ ] 7.3 Run the launcher and manually verify Add Account, Settings/Feedback, About, main window title, and default resolution behavior.
- [x] 7.4 Verify `FORK.MD` matches the final diff and current upstream base information.
