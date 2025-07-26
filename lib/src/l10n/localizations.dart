/// Returns the plural form of a word based on the count.
typedef Pluralizer = String Function(int count);

/// Abstract class for localization strings.
abstract class HumanReadableLocalizations {
  String get outOf;

  Pluralizer get year;
  Pluralizer get day;
  Pluralizer get hour;
  Pluralizer get minute;
  Pluralizer get second;
  Pluralizer get millisecond;
  Pluralizer get microsecond;

  // File Size
  String fileSizeByte(int count);
  String fileSizeKiloByte(int count);
  String fileSizeMegaByte(int count);
  String fileSizeGigaByte(int count);
  String fileSizeTeraByte(int count);
  String fileSizePetaByte(int count);
  String fileSizeExaByte(int count);
  String fileSizeZettaByte(int count);
  String fileSizeYottaByte(int count);

  String fileSizeKibiByte(int count);
  String fileSizeMebiByte(int count);
  String fileSizeGibiByte(int count);
  String fileSizeTebiByte(int count);
  String fileSizePebiByte(int count);
  String fileSizeExbiByte(int count);
  String fileSizeZebiByte(int count);
  String fileSizeYobiByte(int count);

  // Friendly Date
  String get today;
  String get yesterday;
  String get tomorrow;
  String get last; // as in "Last Monday"
  String get next; // as in "Next Friday"
  String get at; // as in "Today at 3:45 PM"

  // Percentage
  String get percentSymbol;
}

/// English localizations.
class EnLocalizations implements HumanReadableLocalizations {
  const EnLocalizations();

  @override
  String get outOf => 'out of';

  @override
  String fileSizeByte(int count) => 'B';
  @override
  String fileSizeKiloByte(int count) => 'KB';
  @override
  String fileSizeMegaByte(int count) => 'MB';
  @override
  String fileSizeGigaByte(int count) => 'GB';
  @override
  String fileSizeTeraByte(int count) => 'TB';
  @override
  String fileSizePetaByte(int count) => 'PB';
  @override
  String fileSizeExaByte(int count) => 'EB';
  @override
  String fileSizeZettaByte(int count) => 'ZB';
  @override
  String fileSizeYottaByte(int count) => 'YB';

  @override
  String fileSizeKibiByte(int count) => 'KiB';
  @override
  String fileSizeMebiByte(int count) => 'MiB';
  @override
  String fileSizeGibiByte(int count) => 'GiB';
  @override
  String fileSizeTebiByte(int count) => 'TiB';
  @override
  String fileSizePebiByte(int count) => 'PiB';
  @override
  String fileSizeExbiByte(int count) => 'EiB';
  @override
  String fileSizeZebiByte(int count) => 'ZiB';
  @override
  String fileSizeYobiByte(int count) => 'YiB';

  @override
  Pluralizer get year => (int count) => count == 1 ? 'year' : 'years';

  @override
  Pluralizer get day => (int count) => count == 1 ? 'day' : 'days';

  @override
  Pluralizer get hour => (int count) => count == 1 ? 'hour' : 'hours';

  @override
  Pluralizer get minute => (int count) => count == 1 ? 'minute' : 'minutes';

  @override
  Pluralizer get second => (int count) => count == 1 ? 'second' : 'seconds';

  @override
  Pluralizer get millisecond => (int count) => count == 1 ? 'millisecond' : 'milliseconds';

  @override
  Pluralizer get microsecond => (int count) => count == 1 ? 'microsecond' : 'microseconds';

  @override
  String get today => 'Today';
  @override
  String get yesterday => 'Yesterday';
  @override
  String get tomorrow => 'Tomorrow';
  @override
  String get last => 'Last';
  @override
  String get next => 'Next';
  @override
  String get at => 'at';

  @override
  String get percentSymbol => '%';
}

/// Spanish localizations.
class EsLocalizations implements HumanReadableLocalizations {
  const EsLocalizations();

  @override
  String get outOf => 'de';

  @override
  String fileSizeByte(int count) => 'B';
  @override
  String fileSizeKiloByte(int count) => 'KB';
  @override
  String fileSizeMegaByte(int count) => 'MB';
  @override
  String fileSizeGigaByte(int count) => 'GB';
  @override
  String fileSizeTeraByte(int count) => 'TB';
  @override
  String fileSizePetaByte(int count) => 'PB';
  @override
  String fileSizeExaByte(int count) => 'EB';
  @override
  String fileSizeZettaByte(int count) => 'ZB';
  @override
  String fileSizeYottaByte(int count) => 'YB';

  @override
  String fileSizeKibiByte(int count) => 'KiB';
  @override
  String fileSizeMebiByte(int count) => 'MiB';
  @override
  String fileSizeGibiByte(int count) => 'GiB';
  @override
  String fileSizeTebiByte(int count) => 'TiB';
  @override
  String fileSizePebiByte(int count) => 'PiB';
  @override
  String fileSizeExbiByte(int count) => 'EiB';
  @override
  String fileSizeZebiByte(int count) => 'ZiB';
  @override
  String fileSizeYobiByte(int count) => 'YiB';

  @override
  Pluralizer get year => (int count) => count == 1 ? 'año' : 'años';

  @override
  Pluralizer get day => (int count) => count == 1 ? 'día' : 'días';

  @override
  Pluralizer get hour => (int count) => count == 1 ? 'hora' : 'horas';

  @override
  Pluralizer get minute => (int count) => count == 1 ? 'minuto' : 'minutos';

  @override
  Pluralizer get second => (int count) => count == 1 ? 'segundo' : 'segundos';

  @override
  Pluralizer get millisecond => (int count) => count == 1 ? 'milisegundo' : 'milisegundos';

  @override
  Pluralizer get microsecond => (int count) => count == 1 ? 'microsegundo' : 'microsegundos';

  @override
  String get today => 'Hoy';
  @override
  String get yesterday => 'Ayer';
  @override
  String get tomorrow => 'Mañana';
  @override
  String get last => 'El';
  @override
  String get next => 'El próximo';
  @override
  String get at => 'a las';

  @override
  String get percentSymbol => '%';
}

/// A map of supported localizations.
const _localizations = <String, HumanReadableLocalizations>{
  'en': EnLocalizations(),
  'es': EsLocalizations(),
};

/// Returns the localizations for the given [locale].
/// Defaults to English if the locale is not supported.
HumanReadableLocalizations getLocalizations(String? locale) {
  final languageCode = locale?.split('_').first ?? 'en';
  return _localizations[languageCode] ?? _localizations['en']!;
}
