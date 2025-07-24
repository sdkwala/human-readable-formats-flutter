import 'package:test/test.dart';
import 'package:human_readable_formats/human_readable_formats.dart';

void main() {
  group('humanizeFileSize', () {
    test('formats bytes', () {
      expect(humanizeFileSize(0), '0 B');
      expect(humanizeFileSize(512), '512 B');
      expect(humanizeFileSize(1023), '1023 B');
    });
    test('formats KB', () {
      expect(humanizeFileSize(1024), '1 KB');
      expect(humanizeFileSize(1536), '1.5 KB');
      expect(humanizeFileSize(2048), '2 KB');
    });
    test('formats MB', () {
      expect(humanizeFileSize(1048576), '1 MB');
      expect(humanizeFileSize(1572864), '1.5 MB');
      expect(humanizeFileSize(2097152), '2 MB');
    });
    test('formats GB', () {
      expect(humanizeFileSize(1073741824), '1 GB');
      expect(humanizeFileSize(1610612736), '1.5 GB');
      expect(humanizeFileSize(2147483648), '2 GB');
    });
    test('formats TB', () {
      expect(humanizeFileSize(1099511627776), '1 TB');
    });
    test('decimalPlaces option', () {
      expect(humanizeFileSize(1536, decimalPlaces: 1), '1.5 KB');
      expect(humanizeFileSize(1536, decimalPlaces: 0), '2 KB');
    });
    test('throws on negative', () {
      expect(() => humanizeFileSize(-1), throwsArgumentError);
    });
  });
}
