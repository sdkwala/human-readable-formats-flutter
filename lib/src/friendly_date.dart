import 'package:intl/intl.dart';

import 'package:human_readable_formats/src/config.dart';
import 'l10n/localizations.dart';

/// Formats a [DateTime] into a friendly, human-readable date and time string.
///
/// Examples:
/// - `humanizeFriendlyDate(DateTime.now())` -> `'Today'`
/// - `humanizeFriendlyDate(DateTime.now(), includeTime: true)` -> `'Today at 3:45 PM'`
/// - `humanizeFriendlyDate(DateTime.now().subtract(Duration(days: 1)))` -> `'Yesterday'`
///
/// - [date]: The date to format.
/// - [now]: The reference time. Defaults to `DateTime.now()`.
/// - [includeTime]: Whether to include the time in the output.
String humanizeFriendlyDate(
  DateTime date, {
  DateTime? now,
  bool includeTime = false,
  String? locale,
}) {
  now ??= DateTime.now();
  final l10n = getLocalizations(locale ?? HumanReadableConfig.instance.locale);
  final today = DateTime(now.year, now.month, now.day);
  final targetDate = DateTime(date.year, date.month, date.day);
  final difference = targetDate.difference(today).inDays;

  String friendlyDate;

  if (difference == 0) {
    friendlyDate = l10n.today;
  } else if (difference == -1) {
    friendlyDate = l10n.yesterday;
  } else if (difference == 1) {
    friendlyDate = l10n.tomorrow;
  } else if (difference > -7 && difference < 0) {
    friendlyDate = '${l10n.last} ${DateFormat('EEEE').format(date)}';
  } else if (difference > 0 && difference < 7) {
    friendlyDate = '${l10n.next} ${DateFormat('EEEE').format(date)}';
  } else {
    friendlyDate = DateFormat('MMM d, y').format(date);
  }

  if (includeTime) {
    final timeFormat = DateFormat.jm(); // e.g., 5:08 PM
    final timeString = timeFormat.format(date);
    return '$friendlyDate ${l10n.at} $timeString';
  }

  return friendlyDate;
}
