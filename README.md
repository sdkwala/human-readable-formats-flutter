# Human Readable Formats

A pure all in one Dart package to format raw data like numbers, dates, and file sizes into human-readable text. This package is platform-independent and has no dependency on Flutter, making it suitable for any Dart project.

## Brought to you by SDKWala

This project is an open-source initiative by [SDKWala](https://www.sdkwala.com), a company dedicated to creating high-quality, developer-friendly SDKs and open-source projects. 

- **Website**: [www.sdkwala.com](https://www.sdkwala.com)
- **GitHub**: [https://github.com/sdkwala](https://github.com/sdkwala)

## Features

- **Relative Time**: Format `DateTime` as a relative time string (e.g., "5 minutes ago").
- **Compact Numbers**: Format large numbers into a compact form (e.g., "1.23M").
- **Ordinals**: Convert integers to ordinal strings (e.g., "2nd", "3rd").
- **Currency**: Format numbers as currency with customizable symbols (e.g., "₹99").
- **Booleans**: Convert booleans to human-readable strings (e.g., "Yes", "No").
- **Lists**: Format lists into a human-readable enumeration (e.g., "apples, bananas, and oranges").

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  human_readable_formats: ^0.0.1 # Replace with the latest version
```

Then, run `dart pub get`.

## Usage

```dart
import 'package:human_readable_formats/humanize.dart';

void main() {
  // Relative time
  final fiveMinutesAgo = DateTime.now().subtract(const Duration(minutes: 5));
  print(humanizeRelativeTime(fiveMinutesAgo)); // "5 minutes ago"

  // Compact numbers
  print(humanizeCompactNumber(1234567)); // "1.23M"

  // Ordinals
  print(humanizeOrdinal(21)); // "21st"

  // Currency
  print(humanizeCurrency(99, symbol: '\$')); // "$99"

  // Booleans
  print(humanizeBoolean(true, positive: 'Active', negative: 'Inactive')); // "Active"

  // Lists
  print(humanizeList(['apples', 'bananas', 'oranges'])); // "apples, bananas, and oranges"
}
```

## API Reference

- `humanizeRelativeTime(DateTime dateTime, {DateTime? now})`: Formats a `DateTime` into a relative time string.
- `humanizeCompactNumber(num number, {String? locale})`: Formats a number into a compact form.
- `humanizeOrdinal(int number)`: Converts an integer to its ordinal representation.
- `humanizeCurrency(num amount, {String symbol = '₹', String? locale})`: Formats a number as currency.
- `humanizeBoolean(bool? value, {String positive = 'Yes', String negative = 'No', String? nullValue})`: Converts a boolean to a human-readable string.
- `humanizeList(List<String> items, {String conjunction = 'and', bool oxfordComma = true})`: Formats a list into a human-readable enumeration.

## Contributing

Contributions are welcome! If you have a feature request, bug report, or want to contribute to the code, please feel free to open an issue or submit a pull request on our [GitHub repository](https://github.com/sdkwala/human-readable-formats-flutter).

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
