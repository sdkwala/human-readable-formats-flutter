import 'package:test/test.dart';
import 'package:human_readable_formats/humanize.dart';

void main() {
  group('humanizeDuration', () {
    test('formats seconds', () {
      expect(humanizeDuration(Duration(seconds: 0)), '0s');
      expect(humanizeDuration(Duration(seconds: 45)), '45s');
    });
    test('formats minutes and seconds', () {
      expect(humanizeDuration(Duration(minutes: 2, seconds: 10)), '2m');
      expect(humanizeDuration(Duration(minutes: 5)), '5m');
    });
    test('formats hours, minutes', () {
      expect(humanizeDuration(Duration(hours: 1, minutes: 25)), '1h 25m');
      expect(humanizeDuration(Duration(hours: 3)), '3h');
    });
    test('formats days, hours', () {
      expect(humanizeDuration(Duration(days: 2, hours: 3)), '2d 3h');
      expect(humanizeDuration(Duration(days: 1)), '1d');
    });
    test('does not show zero units', () {
      expect(humanizeDuration(Duration(hours: 0, minutes: 0, seconds: 5)), '5s');
      expect(humanizeDuration(Duration(hours: 0, minutes: 2, seconds: 0)), '2m');
    });
  });
}
