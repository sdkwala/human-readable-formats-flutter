/// Formats a boolean value into a human-readable string.
/// Examples: 'Yes', 'No', 'Active', 'Inactive', 'Enabled', 'Disabled'
String humanizeBoolean(bool? value, {String positive = 'Yes', String negative = 'No', String? nullValue}) {
  if (value == null) return nullValue ?? 'Unknown';
  return value ? positive : negative;
}
