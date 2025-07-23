import 'package:intl/intl.dart';

/// Formats a number as a currency string (e.g., ₹99).
String humanizeCurrency(num amount, {String symbol = '₹', String? locale}) {
  final format = NumberFormat.currency(symbol: symbol, locale: locale, decimalDigits: 0);
  return format.format(amount);
}
