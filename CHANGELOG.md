# Changelog

## 0.1.0

### New Features
- Added file size formatting with support for SI and IEC standards
- Added duration formatting with short and long styles
- Added friendly date formatting (e.g., "Today", "Yesterday", "Tomorrow at 3:45 PM")
- Added percentage and ratio formatting
- Added comprehensive localization support (English and Spanish)
- Added global configuration system for default settings
- Added fluent builder API for method chaining
- Added extensive test coverage

### Breaking Changes
- Removed Flutter widget dependencies (now pure Dart)
- Changed file size formatting to use `FileSizeStandard` enum instead of boolean flags
- Updated default decimal places behavior to be more intuitive
- Moved global configuration access into function bodies to fix compile-time constant issues

### Improvements
- Improved documentation with comprehensive examples
- Added migration guide for users upgrading from v0.0.x
- Added code examples for all major features
- Improved type safety and error handling

## 0.0.1

* Initial release of the package.
