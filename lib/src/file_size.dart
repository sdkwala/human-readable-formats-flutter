/// Formats a number of bytes into a human-readable file size string (e.g., '1.2 MB').
String humanizeFileSize(int bytes, {int decimalPlaces = 2}) {
  if (bytes < 0) throw ArgumentError('Bytes cannot be negative');
  if (bytes < 1024) return '$bytes B';

  const units = ['KB', 'MB', 'GB', 'TB', 'PB', 'EB'];
  double size = bytes / 1024;
  int unitIndex = 0;

  while (size >= 1024 && unitIndex < units.length - 1) {
    size /= 1024;
    unitIndex++;
  }
  // Remove trailing zeros and decimal point if not needed
  String formatted = size.toStringAsFixed(decimalPlaces);
  // Remove trailing zeros and decimal point if not needed
  if (decimalPlaces > 0) {
    formatted = formatted.replaceFirst(RegExp(r'\.0+'), '');
    formatted = formatted.replaceFirst(RegExp(r'\.?0+'), '');
  }
  return '$formatted ${units[unitIndex]}';
}
