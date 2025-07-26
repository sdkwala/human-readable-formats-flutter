import 'package:human_readable_formats/src/file_size.dart' as fs;
import 'package:human_readable_formats/src/duration.dart' as d;
import 'package:human_readable_formats/src/friendly_date.dart' as fd;
import 'package:human_readable_formats/src/percentage.dart' as p;
import 'package:human_readable_formats/src/ratio.dart' as r;

/// Fluent builder for configuring and formatting human-readable values.
class HumanFormatter {
  String? _locale;
  int? _decimalPlaces;
  fs.FileSizeStandard? _standard;

  HumanFormatter locale(String locale) {
    _locale = locale;
    return this;
  }

  HumanFormatter decimalPlaces(int decimalPlaces) {
    _decimalPlaces = decimalPlaces;
    return this;
  }

  HumanFormatter standard(fs.FileSizeStandard standard) {
    _standard = standard;
    return this;
  }

      String humanizeFileSize(int size, {String? locale, int? decimalPlaces, fs.FileSizeStandard? standard}) {
    return fs.humanizeFileSize(
      size,
      locale: locale ?? _locale,
      decimalPlaces: decimalPlaces ?? _decimalPlaces ?? 2,
      standard: standard ?? _standard ?? fs.FileSizeStandard.iec,
    );
  }

  String humanizeDuration(Duration duration, {String? locale}) {
    return d.humanizeDuration(duration, locale: locale ?? _locale);
  }

  String humanizeFriendlyDate(DateTime date, {String? locale, bool includeTime = false}) {
    return fd.humanizeFriendlyDate(date, locale: locale ?? _locale, includeTime: includeTime);
  }

  String humanizePercentage(num value, {String? locale, int? decimalPlaces, bool isFraction = true}) {
    return p.humanizePercentage(value, locale: locale ?? _locale, decimalPlaces: decimalPlaces ?? _decimalPlaces ?? 1, isFraction: isFraction);
  }

  String humanizeRatio(num numerator, num denominator, {String? locale}) {
    return r.humanizeRatio(numerator, denominator, locale: locale ?? _locale);
  }
}
