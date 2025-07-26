import 'package:human_readable_formats/src/file_size.dart';
import 'package:test/test.dart';

void main() {
  group('humanizeFileSize', () {
    group('IEC Standard (default)', () {
      test('formats bytes correctly', () {
        expect(humanizeFileSize(0), '0 B');
        expect(humanizeFileSize(1023), '1023 B');
      });

      test('formats KiB correctly', () {
        expect(humanizeFileSize(1024), '1 KiB');
        expect(humanizeFileSize(1024, decimalPlaces: 2), '1.00 KiB');
        expect(humanizeFileSize(1536, decimalPlaces: 1), '1.5 KiB');
      });

      test('formats MiB correctly', () {
        expect(humanizeFileSize(1048576), '1 MiB');
        expect(humanizeFileSize(1048576, decimalPlaces: 2), '1.00 MiB');
        expect(humanizeFileSize(1572864, decimalPlaces: 2), '1.50 MiB');
      });

      test('formats GiB correctly', () {
        expect(humanizeFileSize(1073741824), '1 GiB');
        expect(humanizeFileSize(1073741824, decimalPlaces: 2), '1.00 GiB');
        expect(humanizeFileSize(1610612736, decimalPlaces: 2), '1.50 GiB');
      });
    });

    group('SI Standard', () {
      const standard = FileSizeStandard.si;
      test('formats bytes correctly', () {
        expect(humanizeFileSize(0, standard: standard), '0 B');
        expect(humanizeFileSize(999, standard: standard), '999 B');
      });

      test('formats KB correctly', () {
        expect(humanizeFileSize(1000, standard: standard), '1 KB');
        expect(humanizeFileSize(1000, standard: standard, decimalPlaces: 2), '1.00 KB');
        expect(humanizeFileSize(1500, standard: standard, decimalPlaces: 1), '1.5 KB');
      });

      test('formats MB correctly', () {
        expect(humanizeFileSize(1000000, standard: standard), '1 MB');
        expect(humanizeFileSize(1000000, standard: standard, decimalPlaces: 2), '1.00 MB');
        expect(humanizeFileSize(1550000, standard: standard, decimalPlaces: 2), '1.55 MB');
      });

      test('formats GB correctly', () {
        expect(humanizeFileSize(1000000000, standard: standard), '1 GB');
        expect(humanizeFileSize(1000000000, standard: standard, decimalPlaces: 2), '1.00 GB');
        expect(humanizeFileSize(1610000000, standard: standard, decimalPlaces: 2), '1.61 GB');
      });
    });

    group('Formatting Options', () {
      test('handles decimalPlaces correctly', () {
        expect(humanizeFileSize(1572864, decimalPlaces: 1), '1.5 MiB');
        expect(humanizeFileSize(1572864, decimalPlaces: 2), '1.50 MiB');
        expect(humanizeFileSize(1572864, decimalPlaces: 0), '2 MiB'); // Rounds up
        expect(humanizeFileSize(1887436, decimalPlaces: 0), '2 MiB'); // Rounds up
        expect(humanizeFileSize(1500, standard: FileSizeStandard.si, decimalPlaces: 1), '1.5 KB');
      });

      test('removes trailing zeros when decimalPlaces is not specified', () {
        expect(humanizeFileSize(1048576), '1 MiB');
        expect(humanizeFileSize(1572864), '1.5 MiB');
      });
    });

    group('Edge Cases', () {
      test('throws ArgumentError for negative bytes', () {
        expect(() => humanizeFileSize(-1), throwsArgumentError);
      });

      test('throws ArgumentError for negative decimalPlaces', () {
        expect(() => humanizeFileSize(1024, decimalPlaces: -1), throwsArgumentError);
      });
    });

    group('Localization', () {
      test('uses English by default', () {
        expect(humanizeFileSize(0), '0 B');
        expect(humanizeFileSize(1024), '1 KiB');
        expect(humanizeFileSize(1000, standard: FileSizeStandard.si), '1 KB');
      });

      test('uses Spanish when locale is provided', () {
        // File size units are international symbols, so they remain the same
        expect(humanizeFileSize(0, locale: 'es'), '0 B');
        expect(humanizeFileSize(1024, locale: 'es'), '1 KiB');
        expect(humanizeFileSize(1000, standard: FileSizeStandard.si, locale: 'es'), '1 KB');
      });
    });
  });
}

