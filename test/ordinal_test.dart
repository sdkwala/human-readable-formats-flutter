import 'package:test/test.dart';
import 'package:human_readable_formats/humanize.dart';

void main() {
  group('humanizeOrdinal', () {
    test('formats ordinals correctly', () {
      expect(humanizeOrdinal(1), '1st');
      expect(humanizeOrdinal(2), '2nd');
      expect(humanizeOrdinal(3), '3rd');
      expect(humanizeOrdinal(4), '4th');
      expect(humanizeOrdinal(11), '11th');
      expect(humanizeOrdinal(12), '12th');
      expect(humanizeOrdinal(13), '13th');
      expect(humanizeOrdinal(21), '21st');
      expect(humanizeOrdinal(22), '22nd');
      expect(humanizeOrdinal(23), '23rd');
      expect(humanizeOrdinal(101), '101st');
    });
  });
}
