## ADDED Requirements

### Requirement: Built-in Paradise login source
The launcher SHALL provide a built-in authlib-injector login source named `椛鸟风月` using the Paradise Yggdrasil API root `https://paradise.mahoutsukai.cn/api/paradise/yggdrasil/`.

#### Scenario: Built-in source exists
- **WHEN** account services are initialized
- **THEN** the authlib-injector server list contains the `椛鸟风月` built-in source

#### Scenario: Built-in source is restored
- **WHEN** user configuration does not contain the Paradise Yggdrasil API root
- **THEN** initialization restores the built-in `椛鸟风月` source

### Requirement: Built-in source is name-only in account creation
The account creation UI SHALL display the built-in Paradise login source as `椛鸟风月` without exposing its API URL in the visible title, subtitle, or tooltip for that option.

#### Scenario: Add account list renders built-in source
- **WHEN** the Add Account navigation list is shown
- **THEN** the built-in source displays `椛鸟风月`
- **AND** the API URL is not shown for that source

### Requirement: Built-in source cannot be removed
The launcher SHALL prevent users from deleting the built-in Paradise login source while preserving delete behavior for user-added authlib-injector sources.

#### Scenario: Built-in source has no delete action
- **WHEN** the Add Account navigation list renders the built-in source
- **THEN** no remove or close action is available for that source

#### Scenario: Custom source remains removable
- **WHEN** the Add Account navigation list renders a user-added authlib-injector source
- **THEN** the remove action remains available for that custom source

### Requirement: LittleSkin default tracking is removed
The launcher SHALL NOT use LittleSkin-specific default source state such as `addedLittleSkin` to control Paradise source insertion.

#### Scenario: Default source initialization
- **WHEN** account services initialize
- **THEN** no LittleSkin URL or `addedLittleSkin` gate is required to add the Paradise source
