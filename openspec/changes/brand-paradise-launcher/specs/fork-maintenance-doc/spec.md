## ADDED Requirements

### Requirement: Fork maintenance document exists
The repository SHALL contain a root-level `FORK.MD` documenting fork-specific changes and current upstream HMCL base information.

#### Scenario: Maintenance document is present
- **WHEN** a maintainer opens the repository root
- **THEN** `FORK.MD` is present

### Requirement: Maintenance document summarizes fork deltas
`FORK.MD` SHALL summarize all Paradise fork changes introduced by this change, including auth source behavior, branding, links, warnings/help removal, default resolution, assets, and UI surfaces.

#### Scenario: Maintainer reviews fork changes
- **WHEN** a maintainer reads `FORK.MD`
- **THEN** they can identify the fork-specific code areas and behavior changes

### Requirement: Maintenance document records upstream branch state
`FORK.MD` SHALL record the current `hmcl/main` tracking branch information, including the upstream remote and base commit at the time the document is updated.

#### Scenario: Maintainer checks upstream base
- **WHEN** a maintainer reads the upstream section of `FORK.MD`
- **THEN** they can see the tracked upstream branch and commit used as the maintenance base
