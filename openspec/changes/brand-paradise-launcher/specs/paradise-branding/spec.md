## ADDED Requirements

### Requirement: Launcher identity uses Paradise branding
The launcher SHALL present the product name `椛鸟风月` and the configured fork version on user-facing launcher identity surfaces while preserving upstream HMCL version information separately for diagnostics and maintenance.

#### Scenario: Main window title
- **WHEN** the launcher main window is displayed
- **THEN** the visible title identifies the launcher as `椛鸟风月 <forkVersion>`

#### Scenario: Upstream version retained
- **WHEN** diagnostics or maintenance documentation need upstream base information
- **THEN** the upstream HMCL version and branch/base commit remain available separately from the fork version

### Requirement: Preview and unofficial HMCL warnings are hidden
The launcher SHALL NOT show preview, third-party, or unofficial HMCL warning banners in normal fork builds.

#### Scenario: Main page opens
- **WHEN** a user opens the main page
- **THEN** no preview/nightly/dev announcement is shown solely because the build is not upstream stable HMCL

#### Scenario: Account login opens
- **WHEN** a user opens Microsoft or authlib-injector account login UI
- **THEN** no unofficial HMCL warning or third-party HMCL warning is shown

### Requirement: Top-right help affordance is removed
The launcher SHALL NOT show the top-right question mark/help button in the decorated launcher frame.

#### Scenario: Decorated page renders
- **WHEN** a page using the standard launcher decorator is displayed
- **THEN** the top-right question mark/help button is absent

### Requirement: General settings use Paradise links
The General settings UI SHALL remove the upstream official group entry and expose the Paradise official website entry.

#### Scenario: General settings renders links
- **WHEN** the user opens General settings
- **THEN** no upstream official group item is shown
- **AND** a Paradise official website item is shown

### Requirement: Feedback area contains Paradise tab
The Settings/Feedback area SHALL provide a `椛鸟风月` top-level tab or section containing links for official website, QQ group, and 黑盒语音.

#### Scenario: Paradise feedback tab renders
- **WHEN** the user opens the feedback area
- **THEN** the `椛鸟风月` tab or section is available
- **AND** it contains official website, QQ group, and 黑盒语音 link actions

### Requirement: About page prioritizes Paradise fork information
The About page SHALL place Paradise fork information and acknowledgements at the top of their respective sections.

#### Scenario: About summary renders
- **WHEN** the user opens About
- **THEN** `椛鸟风月` and the configured fork version appear before upstream HMCL details

#### Scenario: About thanks renders
- **WHEN** the user views About acknowledgements
- **THEN** `缇尔蒂` appears at the top of thanks and links to `https://www.tiltysola.com`

### Requirement: Fork assets are bundled locally
The launcher SHALL bundle the provided Paradise PNG and 缇尔蒂 avatar as local resources for use in fork-branded UI.

#### Scenario: Branded UI loads offline
- **WHEN** the launcher is built and run without network access
- **THEN** fork-branded UI can load the bundled Paradise and 缇尔蒂 images without fetching remote URLs
