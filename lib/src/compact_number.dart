import 'package:intl/intl.dart';

/// Formats a number into a compact string (e.g., 1.2M, 5.6K).
String humanizeCompactNumber(num number, {String? locale}) {
  final format = NumberFormat.compact(locale: locale);
  return format.format(number);
}
