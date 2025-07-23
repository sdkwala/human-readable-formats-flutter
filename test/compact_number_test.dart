import 'package:test/test.dart';
import 'package:human_readable_formats/humanize.dart';

void main() {
  group('humanizeCompactNumber', () {
    test('formats numbers correctly', () {
      expect(humanizeCompactNumber(123), '123');
      expect(humanizeCompactNumber(1234), '1.23K');
      expect(humanizeCompactNumber(1234567), '1.23M');
      expect(humanizeCompactNumber(987654321), '988M');
      expect(humanizeCompactNumber(1234567890), '1.23B');
    });
  });
}
