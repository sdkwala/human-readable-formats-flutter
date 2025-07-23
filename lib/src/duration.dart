/// Formats a [Duration] into a concise, human-readable string (e.g., '1h 25m', '2d 3h', '45s').
String humanizeDuration(Duration duration) {
  if (duration.inSeconds < 1) return '0s';
  final days = duration.inDays;
  final hours = duration.inHours % 24;
  final minutes = duration.inMinutes % 60;
  final seconds = duration.inSeconds % 60;
  final parts = <String>[];
  if (days > 0) parts.add('${days}d');
  if (hours > 0) parts.add('${hours}h');
  if (minutes > 0) parts.add('${minutes}m');
  if (seconds > 0 && parts.isEmpty) parts.add('${seconds}s'); // Only show seconds if nothing else
  return parts.join(' ');
}
