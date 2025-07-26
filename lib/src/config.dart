import 'package:human_readable_formats/src/file_size.dart';

/// Global configuration for the human-readable formats library.
///
/// Use this singleton to set application-wide defaults for locale, decimal places,
/// and other format settings.
///
/// Example:
/// ```dart
/// // Set the default locale for the entire app
/// HumanReadableConfig.instance.locale = 'es';
///
/// // This will now format using Spanish translations by default
/// print(humanizeDuration(Duration(days: 1))); // '1 día'
/// ```
class HumanReadableConfig {
  /// The global default locale for all formatting functions.
  /// If not set, the system locale will be used, with a fallback to 'en'.
  String? locale;

  /// The global default for the number of decimal places to use in formatting.
  int? decimalPlaces;

  /// The global default for the file size standard (SI or IEC).
  FileSizeStandard? fileSizeStandard;

  // Private constructor for the singleton pattern.
  HumanReadableConfig._();

  /// The single, shared instance of [HumanReadableConfig].
  static final HumanReadableConfig instance = HumanReadableConfig._();

  /// Resets all global configuration settings to their default (null) values.
  /// Useful for testing to ensure a clean state between tests.
  void reset() {
    locale = null;
    decimalPlaces = null;
    fileSizeStandard = null;
  }
}
