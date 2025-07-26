import 'package:human_readable_formats/src/config.dart';
import 'package:human_readable_formats/src/l10n/localizations.dart';

/// Formats a ratio of two numbers into a human-readable string (e.g., '3 out of 4').
///
/// - [part]: The numerator or the part of the whole.
/// - [total]: The denominator or the total amount.
/// - [locale]: The locale to use for translations.
String humanizeRatio(num part, num total, {String? locale}) {
  if (total == 0) {
    throw ArgumentError('Total cannot be zero.');
  }
  final l10n = getLocalizations(locale ?? HumanReadableConfig.instance.locale);
  return '$part ${l10n.outOf} $total';
}
