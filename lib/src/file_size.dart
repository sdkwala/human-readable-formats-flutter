import 'dart:math';

import 'package:human_readable_formats/src/config.dart';


import 'l10n/localizations.dart';

/// The standard for calculating file sizes.
enum FileSizeStandard {
  /// International System of Units (SI) - Powers of 1000.
  si,

  /// International Electrotechnical Commission (IEC) - Powers of 1024.
  iec,
}

/// Formats a number of bytes into a human-readable file size string.
///
/// Example:
/// ```dart
/// humanizeFileSize(1572864); // '1.50 MiB'
/// humanizeFileSize(1500000, standard: FileSizeStandard.si); // '1.50 MB'
/// ```
///
/// - [bytes]: The number of bytes.
/// - [decimalPlaces]: The number of decimal places to use.
/// - [standard]: The standard to use for calculation (SI or IEC). Defaults to IEC.
String humanizeFileSize(
  int bytes, {
  int? decimalPlaces,
  FileSizeStandard? standard,
  String? locale,
}) {
  final effectiveStandard = standard ?? HumanReadableConfig.instance.fileSizeStandard ?? FileSizeStandard.iec;
  final effectiveLocale = locale ?? HumanReadableConfig.instance.locale;
  final effectiveDecimalPlaces = decimalPlaces ?? HumanReadableConfig.instance.decimalPlaces ?? 2;
  final bool wasDecimalPlacesSpecified = decimalPlaces != null || HumanReadableConfig.instance.decimalPlaces != null;
  if (bytes < 0) throw ArgumentError('Bytes cannot be negative');
  if (effectiveDecimalPlaces < 0) {
    throw ArgumentError('Decimal places cannot be negative');
  }

  final l10n = getLocalizations(effectiveLocale);
  
  if (bytes == 0) return '0 ${l10n.fileSizeByte(0)}';

  final int base = effectiveStandard == FileSizeStandard.si ? 1000 : 1024;
  final List<String> units = effectiveStandard == FileSizeStandard.si
      ? [
          l10n.fileSizeByte(1),
          l10n.fileSizeKiloByte(1),
          l10n.fileSizeMegaByte(1),
          l10n.fileSizeGigaByte(1),
          l10n.fileSizeTeraByte(1),
          l10n.fileSizePetaByte(1),
          l10n.fileSizeExaByte(1),
          l10n.fileSizeZettaByte(1),
          l10n.fileSizeYottaByte(1),
        ]
      : [
          l10n.fileSizeByte(1),
          l10n.fileSizeKibiByte(1),
          l10n.fileSizeMebiByte(1),
          l10n.fileSizeGibiByte(1),
          l10n.fileSizeTebiByte(1),
          l10n.fileSizePebiByte(1),
          l10n.fileSizeExbiByte(1),
          l10n.fileSizeZebiByte(1),
          l10n.fileSizeYobiByte(1),
        ];

  if (bytes < base) return '$bytes ${l10n.fileSizeByte(bytes)}';

  final int exponent = (log(bytes) / log(base)).floor();
  final String unit = units[exponent];
  final double size = bytes / pow(base, exponent);

  String formatted = size.toStringAsFixed(effectiveDecimalPlaces);

  // Remove trailing zeros and the decimal point if not needed, but only if
  // the user didn't explicitly ask for a certain number of decimal places.
  if (!wasDecimalPlacesSpecified && formatted.contains('.')) {
    formatted = formatted.replaceAll(RegExp(r'0+$'), '');
    if (formatted.endsWith('.')) {
      formatted = formatted.substring(0, formatted.length - 1);
    }
  }

  return '$formatted $unit';
}
