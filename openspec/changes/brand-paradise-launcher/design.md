## Context

This fork currently inherits HMCL identity, warnings, help/community entry points, and default configuration behavior. The existing Paradise authentication source work is in `Accounts` and `AccountListPage`, while broader launcher identity is spread across `Metadata`, Gradle-generated properties, JavaFX pages, and i18n resource bundles.

The implementation must keep upstream HMCL version information available for maintenance while presenting a separate 椛鸟风月 product name and fork version to users. Existing user configuration can remain compatible, but new built-in fork behavior should not depend on removable user config entries.

## Goals / Non-Goals

**Goals:**
- Present 椛鸟风月 as the launcher identity with fork version `2026.05.13a`.
- Keep upstream HMCL version/base information separately available for diagnostics and `FORK.MD`.
- Make the Paradise authentication source built in, name-only in account creation UI, and not removable.
- Remove user-facing HMCL preview/unofficial warnings and top-right help affordance.
- Replace or add fork-specific links in General settings, Feedback, and About.
- Change default game resolution to `1280x720`.
- Document all fork deltas in `FORK.MD`.

**Non-Goals:**
- Rebranding every internal package, class, or GPL copyright header.
- Removing all HMCL attribution or license information.
- Changing Minecraft authentication protocols beyond the built-in server source behavior.
- Changing existing user-created custom authlib-injector servers.

## Decisions

1. Keep fork identity separate from upstream HMCL metadata.
   - Add or generate fork metadata fields for display name and fork version instead of overwriting every use of `Metadata.VERSION`.
   - Rationale: diagnostics, update checks, and maintenance docs still need to know the upstream/base HMCL version.
   - Alternative considered: replacing `hmcl.version` globally. This risks breaking update/version logic and hiding upstream base state.

2. Treat Paradise auth source as built-in runtime state, not only persisted config.
   - Keep a constant URL/name in `Accounts`, ensure it is present at initialization, and expose a predicate for UI logic.
   - Hide API URL in Add Account display for this built-in source and suppress its delete action.
   - Alternative considered: storing a flag in `hmcl.json`. This makes the built-in behavior user-editable and does not satisfy the non-removable requirement.

3. Remove obsolete LittleSkin default tracking only after replacing it with fork-specific semantics.
   - The `addedLittleSkin` flag should be removed or replaced with a fork-specific field only if config compatibility impact is acceptable.
   - If retained temporarily, it must not drive Paradise source presence.
   - Alternative considered: leave the flag as-is. This creates confusing dead code and was explicitly rejected.

4. Implement link additions through localized resources and existing page components.
   - Update `FeedbackPage`, `LauncherSettingsPage`/related settings pages, and About page construction to add 椛鸟风月 entries at the top.
   - Use existing `LineButton`/navigation drawer patterns to reduce UI churn.

5. Use local resource assets for branding.
   - Download the provided PNG/avatar into versioned asset filenames under `HMCL/src/main/resources/assets/img` or a fork-specific asset folder.
   - Rationale: build output must not depend on remote image availability.

## Risks / Trade-offs

- URL ambiguity: The requested official website is written as `https://paradise..mahoutsukai.cn`, which may be a typo. → Confirm or intentionally preserve the provided URL before implementation.
- Config migration risk: Removing `addedLittleSkin` from config serialization may leave harmless stale fields in existing `hmcl.json`. → Prefer backward-compatible deserialization and only remove active code paths.
- Warning removal risk: Some upstream warnings are tied to Microsoft login trust/integrity checks. → Remove user-facing fork warnings intentionally while keeping underlying auth and integrity logic that is still required for functionality.
- Branding risk: Changing `Metadata.NAME` directly may affect launch arguments and modpack metadata. → Introduce fork display fields and update only user-facing surfaces unless a specific runtime identifier must change.
- Asset download risk: Remote images may fail during implementation. → Download once into repo assets and document source URLs in `FORK.MD`.

## Migration Plan

1. Add built-in fork constants and ensure the Paradise auth source is inserted independently of old LittleSkin flags.
2. Remove active use of `addedLittleSkin`; if field deletion is risky, leave deserialization compatibility but remove related logic.
3. Update UI surfaces and i18n keys for branding, links, about/thanks, feedback, and help removal.
4. Add local image assets and reference them from About/branding UI where appropriate.
5. Update default `VersionSetting` dimensions to `1280x720`.
6. Create `FORK.MD` with current upstream branch/commit, fork version, assets, URLs, and changed areas.
7. Verify with compile and, if implementing UI changes, a launcher run/manual UI smoke test.

## Open Questions

- Should the official website URL be exactly `https://paradise..mahoutsukai.cn` as requested, or should it be corrected to `https://paradise.mahoutsukai.cn`?
- Should the top-right help button be removed globally from all decorated pages or only from the main launcher frame?
