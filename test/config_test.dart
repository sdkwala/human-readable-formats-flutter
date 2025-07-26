import 'package:test/test.dart';
import 'package:human_readable_formats/human_readable_formats.dart';
import 'package:human_readable_formats/src/config.dart';

void main() {
  group('HumanReadableConfig', () {
    tearDown(() {
      // Reset the config after each test to ensure isolation.
      HumanReadableConfig.instance.reset();
    });

    test('uses default locale when none is set', () {
      // Assuming 'en' is the default fallback
      final date = DateTime.now();
      expect(humanizeFriendlyDate(date), 'Today');
    });

    test('applies global locale setting', () {
      HumanReadableConfig.instance.locale = 'es';
      final date = DateTime.now().subtract(const Duration(days: 1));
      expect(humanizeFriendlyDate(date), 'Ayer');
      expect(humanizeDuration(const Duration(hours: 2), style: DurationTextStyle.long), '2 horas');
    });

    test('applies global decimalPlaces setting', () {
      HumanReadableConfig.instance.decimalPlaces = 3;
      expect(humanizeFileSize(1234567), '1.177 MiB');
      expect(humanizePercentage(0.123456), '12.346%');
    });

    test('direct parameter overrides global locale', () {
      HumanReadableConfig.instance.locale = 'es';
      final date = DateTime.now();
      expect(humanizeFriendlyDate(date, locale: 'en'), 'Today');
    });

    test('direct parameter overrides global decimalPlaces', () {
      HumanReadableConfig.instance.decimalPlaces = 4;
      expect(humanizeFileSize(1234567, decimalPlaces: 1), '1.2 MiB');
    });

    test('applies global fileSizeStandard setting', () {
      HumanReadableConfig.instance.fileSizeStandard = FileSizeStandard.si;
      expect(humanizeFileSize(1234567), '1.23 MB'); // SI standard, default 2 decimal places
    });

    test('reset clears configuration', () {
      HumanReadableConfig.instance.locale = 'es';
      HumanReadableConfig.instance.decimalPlaces = 5;

      HumanReadableConfig.instance.reset();

      expect(HumanReadableConfig.instance.locale, isNull);
      expect(HumanReadableConfig.instance.decimalPlaces, isNull);

      // Verify it falls back to defaults
      final date = DateTime.now();
      expect(humanizeFriendlyDate(date), 'Today');
      expect(humanizeFileSize(1234567), '1.18 MiB'); // Default 2 decimal places
    });
  });
}
