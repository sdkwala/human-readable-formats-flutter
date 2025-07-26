import 'package:human_readable_formats/src/config.dart';
import 'l10n/localizations.dart';

/// Formats a number as a percentage string (e.g., '98.5%').
///
/// - [value]: The number to format.
/// - [isFraction]: Whether the input value is a fraction (e.g., 0.75) or a whole number percent (e.g., 75).
/// - [decimalPlaces]: The maximum number of decimal places to show.
String humanizePercentage(
  num value, {
  bool isFraction = true,
  int? decimalPlaces,
  String? locale,
}) {
  final effectiveLocale = locale ?? HumanReadableConfig.instance.locale;
  final effectiveDecimalPlaces = decimalPlaces ?? HumanReadableConfig.instance.decimalPlaces ?? 1;
  final bool wasDecimalPlacesSpecified = decimalPlaces != null || HumanReadableConfig.instance.decimalPlaces != null;
  if (effectiveDecimalPlaces < 0) {
    throw ArgumentError('Decimal places cannot be negative');
  }

  final l10n = getLocalizations(effectiveLocale);

  double percent = isFraction ? value.toDouble() * 100 : value.toDouble();
  String formatted = percent.toStringAsFixed(effectiveDecimalPlaces);

  // Remove trailing zeros and the decimal point if not needed, but only if
  // the user didn't explicitly ask for a certain number of decimal places.
  if (!wasDecimalPlacesSpecified && formatted.contains('.')) {
    formatted = formatted.replaceAll(RegExp(r'0+$'), '');
    if (formatted.endsWith('.')) {
      formatted = formatted.substring(0, formatted.length - 1);
    }
  }

  return '$formatted${l10n.percentSymbol}';
}
