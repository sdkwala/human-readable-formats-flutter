import 'package:human_readable_formats/human_readable_formats.dart';
import 'package:human_readable_formats/src/file_size.dart';
import 'package:test/test.dart';

void main() {
  group('HumanFormatter Builder', () {
    test('sets locale for friendly date', () {
      final formatter = HumanFormatter().locale('es');
      final date = DateTime.now();
      expect(formatter.humanizeFriendlyDate(date), 'Hoy');
    });

    test('sets decimalPlaces and standard for file size', () {
      final formatter = HumanFormatter().decimalPlaces(3).standard(FileSizeStandard.si);
      expect(formatter.humanizeFileSize(1234567), '1.235 MB');
    });

    test('chains multiple properties', () {
      final formatter = HumanFormatter().locale('es').decimalPlaces(1).standard(FileSizeStandard.si);
      expect(formatter.humanizeFileSize(1234567), '1.2 MB');
      final date = DateTime.now().subtract(const Duration(days: 1));
      expect(formatter.humanizeFriendlyDate(date), 'Ayer');
    });

    test('uses correct default standard (IEC)', () {
      final formatter = HumanFormatter().decimalPlaces(2);
      expect(formatter.humanizeFileSize(1572864), '1.50 MiB');
    });

    test('overrides builder config with direct parameter', () {
      final formatter = HumanFormatter().locale('es').decimalPlaces(3).standard(FileSizeStandard.iec);
      // Override decimalPlaces
      expect(formatter.humanizeFileSize(1234567, decimalPlaces: 1), '1.2 MiB');
      // Override locale
      final date = DateTime.now();
      expect(formatter.humanizeFriendlyDate(date, locale: 'en'), 'Today');
      // Override standard
      expect(formatter.humanizeFileSize(1234567, standard: FileSizeStandard.si), '1.235 MB');
    });
  });
}
