# Human Readable Formats

[![pub package](https://img.shields.io/pub/v/human_readable_formats.svg)](https://pub.dev/packages/human_readable_formats)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Test](https://github.com/sdkwala/human-readable-formats-flutter/actions/workflows/test.yml/badge.svg)](https://github.com/sdkwala/human-readable-formats-flutter/actions/workflows/test.yml)
[![codecov](https://codecov.io/gh/sdkwala/human-readable-formats-flutter/graph/badge.svg?token=YOUR-TOKEN-HERE)](https://codecov.io/gh/sdkwala/human-readable-formats-flutter)

A pure Dart package to format raw data like numbers, dates, file sizes, and more into human-readable text. This package is platform-independent and has no dependency on Flutter, making it suitable for any Dart project.

## Brought to you by SDKWala

This project is an open-source initiative by [SDKWala](https://www.sdkwala.com), a company dedicated to creating high-quality, developer-friendly SDKs and open-source projects. 

- **Website**: [www.sdkwala.com](https://www.sdkwala.com)
- **GitHub**: [https://github.com/sdkwala](https://github.com/sdkwala)

## Features

- **File Sizes**: Format bytes into human-readable file sizes (e.g., "1.5 MB", "2.3 GiB").
- **Durations**: Format `Duration` objects into human-readable strings (e.g., "2h 30m").
- **Friendly Dates**: Format dates as relative or friendly strings (e.g., "Today at 3:45 PM", "Tomorrow").
- **Percentages & Ratios**: Format numbers as percentages or ratios (e.g., "75%", "3 out of 4").
- **Localization**: Built-in support for multiple languages (currently English and Spanish).
- **Global Configuration**: Set defaults for locale, decimal places, and more.
- **Fluent API**: Chainable builder API for easy configuration.

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  human_readable_formats: ^0.1.0  # Check for the latest version
```

Then, run `dart pub get`.

## Quick Start

```dart
import 'package:human_readable_formats/human_readable_formats.dart';

void main() {
  // Format file sizes
  print(humanizeFileSize(1572864)); // "1.5 MiB"
  
  // Format durations
  print(humanizeDuration(const Duration(hours: 2, minutes: 30))); // "2h 30m"
  
  // Format friendly dates
  final now = DateTime.now();
  print(humanizeFriendlyDate(now)); // "Today"
  
  // Format percentages
  print(humanizePercentage(0.75)); // "75%"
  
  // Format ratios
  print(humanizeRatio(3, 4)); // "3 out of 4"
}
```

## Comprehensive Usage

### File Sizes

```dart
// Basic usage
print(humanizeFileSize(1024)); // "1 KiB"
print(humanizeFileSize(1000, standard: FileSizeStandard.si)); // "1 KB"

// Custom decimal places
print(humanizeFileSize(1572864, decimalPlaces: 2)); // "1.50 MiB"

// Using the builder API
final formatter = HumanFormatter()
  ..decimalPlaces(2)
  ..standard(FileSizeStandard.si);
print(formatter.humanizeFileSize(1500000)); // "1.50 MB"
```

### Durations

```dart
// Basic usage
print(humanizeDuration(const Duration(hours: 2, minutes: 30))); // "2h 30m"

// Long format
print(humanizeDuration(
  const Duration(days: 2, hours: 5, minutes: 30),
  style: DurationTextStyle.long,
)); // "2 days, 5 hours, and 30 minutes"

// Localization
print(humanizeDuration(
  const Duration(hours: 2),
  locale: 'es',
  style: DurationTextStyle.long,
)); // "2 horas"
```

### Friendly Dates

```dart
final now = DateTime.now();
final yesterday = now.subtract(const Duration(days: 1));

print(humanizeFriendlyDate(now)); // "Today"
print(humanizeFriendlyDate(yesterday)); // "Yesterday"
print(humanizeFriendlyDate(
  now.add(const Duration(days: 1)),
  includeTime: true,
)); // "Tomorrow at 3:45 PM"

// With localization
print(humanizeFriendlyDate(now, locale: 'es')); // "Hoy"
```

### Percentages & Ratios

```dart
// Basic percentage
print(humanizePercentage(0.75)); // "75%"

// Custom decimal places
print(humanizePercentage(0.752, decimalPlaces: 1)); // "75.2%"

// Ratios
print(humanizeRatio(3, 4)); // "3 out of 4"

// Localized ratio
print(humanizeRatio(3, 4, locale: 'es')); // "3 de 4"
```

## Global Configuration

Set default values that apply throughout your app:

```dart
void main() {
  // Set global defaults
  HumanReadableConfig.instance
    ..locale = 'es'  // Default to Spanish
    ..decimalPlaces = 2
    ..fileSizeStandard = FileSizeStandard.si;
    
  // Now all formatting functions will use these defaults
  print(humanizeFileSize(1000)); // "1.00 KB" (SI units)
  print(humanizePercentage(0.5)); // "50.00%"
}
```

## Migration Guide

### From v0.0.x to v0.1.0

The package has been significantly updated with new features and improvements. Here are the key changes:

1. **New Features**:
   - Added file size formatting with support for SI and IEC standards
   - Added duration formatting with short and long styles
   - Added friendly date formatting
   - Added percentage and ratio formatting
   - Added localization support (English and Spanish)
   - Added global configuration
   - Added fluent builder API

2. **Breaking Changes**:
   - Removed Flutter widget dependencies (now pure Dart)
   - Moved to using `FileSizeStandard` enum instead of boolean flags
   - Changed default decimal places behavior to be more intuitive

3. **Migration Steps**:
   - Update your imports if you were using Flutter-specific widgets
   - If you were using custom formatting, update to use the new builder API
   - Test your app thoroughly as the behavior of some formatters may have changed slightly

## API Reference

### Top-level Functions

- `humanizeFileSize(int bytes, {int? decimalPlaces, FileSizeStandard? standard, String? locale})`: Formats bytes into a human-readable string.
- `humanizeDuration(Duration duration, {DurationTextStyle style = DurationTextStyle.short, int? maxUnits, String? conjunction, String? locale})`: Formats a duration into a human-readable string.
- `humanizeFriendlyDate(DateTime date, {DateTime? now, bool includeTime = false, String? locale})`: Formats a date as a friendly string.
- `humanizePercentage(num value, {bool isFraction = true, int? decimalPlaces, String? locale})`: Formats a number as a percentage.
- `humanizeRatio(num numerator, num denominator, {String? locale})`: Formats a ratio of two numbers.

### Builder API

Use the `HumanFormatter` class for a fluent API:

```dart
final formatted = HumanFormatter()
  ..locale('es')
  ..decimalPlaces(2)
  .humanizeFileSize(1572864);
```

## Localization

The package includes built-in support for English (default) and Spanish. To add support for additional languages, you can implement the `HumanReadableLocalizations` interface.

## Contributing

Contributions are welcome! Please read our [contributing guidelines](CONTRIBUTING.md) before submitting pull requests.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
