import 'package:intl/intl.dart';

/// Formats a DateTime into a friendly, human-readable date string.
/// Examples: 'Today', 'Yesterday', 'Tomorrow', 'Last Monday', 'Jan 15, 2024'
String humanizeFriendlyDate(DateTime date, {DateTime? now}) {
  now ??= DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final targetDate = DateTime(date.year, date.month, date.day);
  final difference = targetDate.difference(today).inDays;

  // Handle today
  if (difference == 0) return 'Today';

  // Handle this week and last week (including yesterday/tomorrow)
  if (difference >= -6 && difference <= 6) {
    final dayName = DateFormat('EEEE').format(date);
    if (difference == -1) return 'Yesterday';
    if (difference == 1) return 'Tomorrow';
    if (difference < 0) return 'Last $dayName';
    if (difference > 0) return 'Next $dayName';
  }

  // Fallback to standard date format
  return DateFormat('MMM d, y').format(date);
}
