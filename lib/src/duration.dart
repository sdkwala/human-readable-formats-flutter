import 'package:human_readable_formats/src/config.dart';
import 'package:human_readable_formats/src/l10n/localizations.dart';

/// Defines the text style for the formatted duration.
enum DurationTextStyle {
  /// Short, abbreviated text (e.g., '1h 5m').
  short,

  /// Long, full text (e.g., '1 hour, 5 minutes').
  long,
}

/// Formats a [Duration] into a human-readable string.
///
/// Example:
/// ```dart
/// humanizeDuration(Duration(minutes: 90)); // '1h 30m'
/// humanizeDuration(Duration(minutes: 90), style: DurationTextStyle.long); // '1 hour, 30 minutes'
/// ```
///
/// - [duration]: The duration to format.
/// - [style]: The text style to use (`short` or `long`).
/// - [maxUnits]: The maximum number of time units to display.
/// - [conjunction]: The string to use before the last unit in `long` style.
/// - [locale]: The locale to use for translations.
String humanizeDuration(
  Duration duration, {
  DurationTextStyle style = DurationTextStyle.short,
  int? maxUnits,
  String conjunction = ', ',
  String? locale,
}) {
  final l10n = getLocalizations(locale ?? HumanReadableConfig.instance.locale);

  if (duration.inMicroseconds < 1) {
    return style == DurationTextStyle.short ? '0μs' : '0 ${l10n.microsecond(0)}';
  }

  final parts = <String>[];
  int years = duration.inDays ~/ 365;
  int days = duration.inDays % 365;
  int hours = duration.inHours % 24;
  int minutes = duration.inMinutes % 60;
  int seconds = duration.inSeconds % 60;
  int milliseconds = duration.inMilliseconds % 1000;
  int microseconds = duration.inMicroseconds % 1000;

  void addPart(int value, String shortUnit, Pluralizer longUnit) {
    if (value > 0) {
      if (style == DurationTextStyle.short) {
        parts.add('$value$shortUnit');
      } else {
        parts.add('$value ${longUnit(value)}');
      }
    }
  }

  addPart(years, 'y', l10n.year);
  addPart(days, 'd', l10n.day);
  addPart(hours, 'h', l10n.hour);
  addPart(minutes, 'm', l10n.minute);
  addPart(seconds, 's', l10n.second);
  addPart(milliseconds, 'ms', l10n.millisecond);
  addPart(microseconds, 'μs', l10n.microsecond);

  final limitedParts =
      maxUnits != null && maxUnits < parts.length ? parts.take(maxUnits).toList() : parts;

  if (style == DurationTextStyle.short) {
    return limitedParts.join(' ');
  } else {
    if (limitedParts.isEmpty) {
      return '0 ${l10n.second(0)}';
    }
    if (limitedParts.length == 1) {
      return limitedParts.first;
    } else if (limitedParts.length == 2) {
      return limitedParts.join(' and ');
    } else {
      return '${limitedParts.sublist(0, limitedParts.length - 1).join(', ')}$conjunction${limitedParts.last}';
    }
  }
}
