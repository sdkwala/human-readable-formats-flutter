/// Formats a number as a percentage string (e.g., '98.5%').
/// Accepts values like 0.985 (fraction) or 98.5 (already percent).
String humanizePercentage(num value, {bool isFraction = true, int decimalPlaces = 1}) {
  double percent = isFraction ? value.toDouble() * 100 : value.toDouble();
  String formatted = percent.toStringAsFixed(decimalPlaces);
  // Remove trailing zeros and decimal point if not needed
  if (decimalPlaces > 0) {
    formatted = formatted.replaceFirst(RegExp(r'0+$'), '');
    formatted = formatted.replaceFirst(RegExp(r'\.$'), '');
  }
  return '$formatted%';
}
