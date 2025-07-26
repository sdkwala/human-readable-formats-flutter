/// Parsing utilities for human-readable formats.
///
/// Includes:
/// - parseHumanSize: parses strings like "1.5 GiB" or "2 MB" to bytes (int)
/// - parseDuration: parses strings like "1h 30m" or "2 days" to Duration

import 'dart:core';

/// Parses a human-readable file size string (e.g., '1.5 GiB', '2 MB', '500 B') into bytes (int).
/// Supports both SI (KB, MB, ...) and IEC (KiB, MiB, ...) units.
/// Throws [FormatException] for invalid input.
int parseHumanSize(String input) {
  final pattern = RegExp(r'([\d.,]+)\s*([a-zA-Z]+)', caseSensitive: false);
  final match = pattern.firstMatch(input.trim());
  if (match == null) {
    throw FormatException('Invalid file size format: $input');
  }

  final numStr = match.group(1)!.replaceAll(',', '.');
  final numValue = double.tryParse(numStr);
  if (numValue == null) {
    throw FormatException('Invalid number in file size: $numStr');
  }

  final unit = match.group(2)!.toUpperCase();
  const siUnits = {
    'B': 1,
    'KB': 1e3,
    'MB': 1e6,
    'GB': 1e9,
    'TB': 1e12,
    'PB': 1e15,
    'EB': 1e18,
    'ZB': 1e21,
    'YB': 1e24,
  };
  const iecUnits = {
    'B': 1,
    'KIB': 1024,
    'MIB': 1024 * 1024,
    'GIB': 1024 * 1024 * 1024,
    'TIB': 1024 * 1024 * 1024 * 1024,
    'PIB': 1024 * 1024 * 1024 * 1024 * 1024,
    'EIB': 1024 * 1024 * 1024 * 1024 * 1024 * 1024,
    'ZIB': 1024 * 1024 * 1024 * 1024 * 1024 * 1024 * 1024,
    'YIB': 1024 * 1024 * 1024 * 1024 * 1024 * 1024 * 1024 * 1024,
  };

  if (siUnits.containsKey(unit)) {
    return (numValue * siUnits[unit]!).round();
  } else if (iecUnits.containsKey(unit)) {
    return (numValue * iecUnits[unit]!).round();
  } else {
    throw FormatException('Unknown file size unit: $unit');
  }
}

/// Parses a human-readable duration string (e.g., '1h 30m', '2 days', '45s') into a Dart Duration.
/// Supports both short (h, m, s) and long (hours, minutes, seconds, etc.) unit forms.
/// Throws [FormatException] for invalid input.
Duration parseDuration(String input) {
  if (input.trim().isEmpty) throw FormatException('Empty duration string');
  final pattern = RegExp(r'(\d+(?:[\.,]\d+)?)\s*(ms|milliseconds?|us|microseconds?|y(?:ears?)?|d(?:ays?)?|h(?:ours?)?|m(?:in(?:ute)?s?)?|s(?:ec(?:ond)?s?)?)', caseSensitive: false);
  final matches = pattern.allMatches(input);
  if (matches.isEmpty) throw FormatException('Invalid duration format: $input');

  int years = 0, days = 0, hours = 0, minutes = 0, seconds = 0, milliseconds = 0, microseconds = 0;

  for (final match in matches) {
    final valueStr = match.group(1)!.replaceAll(',', '.');
    final value = double.tryParse(valueStr);
    if (value == null) throw FormatException('Invalid number in duration: $valueStr');
    final unit = match.group(2)!.toLowerCase();
    if (unit.startsWith('ms')) {
      milliseconds += value.round();
    } else if (unit.startsWith('us')) {
      microseconds += value.round();
    } else if (unit.startsWith('y')) {
      years += value.round();
    } else if (unit.startsWith('d')) {
      days += value.round();
    } else if (unit.startsWith('h')) {
      hours += value.round();
    } else if (unit.startsWith('m')) {
      minutes += value.round();
    } else if (unit.startsWith('s')) {
      seconds += value.round();
    } else {
      throw FormatException('Unknown duration unit: $unit');
    }
  }

  // Dart Duration does not support years, so convert years to days (approximate, 365 days per year)
  days += years * 365;

  return Duration(
    days: days,
    hours: hours,
    minutes: minutes,
    seconds: seconds,
    milliseconds: milliseconds,
    microseconds: microseconds,
  );
}
