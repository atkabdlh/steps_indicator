All notable changes to this project will be documented in this file.

## [0.0.2] - 2025-01-07

### Added
- Introduced `StepItemModel` to provide more flexibility for step customization. Each step can now have:
  - `title`
  - `subtitle1`
  - `subtitle2`
  - `contents`
- Added support for `IndicatorType` with the following options:
  - `IndicatorType.onlyCurrent`
  - `IndicatorType.previous`
- Added `stepItemHeight` parameter to control the height of each step item.
- Added widget overrides for step indicators:
  - `selectedIndicator` for the current step.
  - `normalIndicator` for other steps.

### Changed
- Updated `steps` parameter to accept a `List<StepItemModel>` instead of a generic `List`.
- Improved validation for `StepItemModel`: either `title` or `contents` must be provided, or an error is thrown.

---

## [0.0.1] - 2025-01-07

### Added
- Initial release of `StepsIndicatorWidget` with the following features:
  - Default steps indicator.
  - Dashed steps indicator.
  - Customizable indicator colors, background colors, and border colors.
  - Support for `LineType.solid` and `LineType.dashed`.