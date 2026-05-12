## ADDED Requirements

### Requirement: Default game resolution is 1280 by 720
New game/version settings SHALL default the Minecraft window resolution to `1280x720`.

#### Scenario: New version setting defaults
- **WHEN** a new version setting is created without explicit width and height
- **THEN** its default width is `1280`
- **AND** its default height is `720`

#### Scenario: Existing configured resolution is preserved
- **WHEN** an existing configuration already stores width and height
- **THEN** the launcher preserves those configured values
