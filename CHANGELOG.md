## [0.7.0] - 2022-07-12
### Changed
* dependency update (`xml` to v6)

## [0.6.0] - 2022-02-18
### Added
* fetch user collection

## [0.5.0] - 2021-11-30
### Added
* `thumbnail` and `image` field to `Family`
### Changed
* dependency update

## [0.4.0] - 2021-10-03

### Breaking
* upgrade Dart to 2.14


## [0.3.0] - 2021-10-03

### Breaking
* migrate to Dart 2.12 and null safety

## [0.3.0-nullsafety] - 2020-10-17

### Breaking
* migrate to Dart 2.12 and null safety

## [0.2.2] - 2021-01-23

### Changed
* `meta` dependency bump

### Added
* field `names` to `BoardGame` with list of alternative names

## [0.2.1] - 2020-10-17

### Fixed
* `getBoardGame` now returns boardgames and expansions

## [0.2.0] - 2020-10-17

### Added
* `videos` field to BoardGame class
* `family`, `forum` and `forumlist` API methods support

## [0.1.1] - 2020-10-09

### Changed
* yearPublished is optional now

### Fixed
* `exact` parameter for `search` request is only send when equals true

## [0.1.0] - 2020-10-09

### Added
* ItemRef - general class for all things returned by API (boardgames, extensions, video games etc)

## [0.0.2] - 2020-10-09

### Fixed
* BoardGameRefDecoder throws exception when yearPublished is null 

## [0.0.1] - 2020-10-07

### Added
* get board game by id
* search board games by name
