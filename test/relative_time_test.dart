import 'package:test/test.dart';
import 'package:human_readable_formats/humanize.dart';

void main() {
  group('humanizeRelativeTime', () {
    final now = DateTime(2025, 7, 21, 19, 37, 36);

    test('just now', () {
      expect(humanizeRelativeTime(now, now: now), 'just now');
      expect(humanizeRelativeTime(now.subtract(Duration(seconds: 10)), now: now), 'just now');
    });

    test('minutes ago', () {
      expect(humanizeRelativeTime(now.subtract(Duration(minutes: 5)), now: now), '5 minutes ago');
      expect(humanizeRelativeTime(now.subtract(Duration(minutes: 1)), now: now), '1 minute ago');
    });

    test('hours ago', () {
      expect(humanizeRelativeTime(now.subtract(Duration(hours: 2)), now: now), '2 hours ago');
      expect(humanizeRelativeTime(now.subtract(Duration(hours: 1)), now: now), '1 hour ago');
    });

    test('days ago', () {
      expect(humanizeRelativeTime(now.subtract(Duration(days: 3)), now: now), '3 days ago');
      expect(humanizeRelativeTime(now.subtract(Duration(days: 1)), now: now), '1 day ago');
    });

    test('weeks ago', () {
      expect(humanizeRelativeTime(now.subtract(Duration(days: 14)), now: now), '2 weeks ago');
      expect(humanizeRelativeTime(now.subtract(Duration(days: 7)), now: now), '1 week ago');
    });

    test('months ago', () {
      expect(humanizeRelativeTime(now.subtract(Duration(days: 60)), now: now), '2 months ago');
      expect(humanizeRelativeTime(now.subtract(Duration(days: 30)), now: now), '1 month ago');
    });

    test('years ago', () {
      expect(humanizeRelativeTime(now.subtract(Duration(days: 730)), now: now), '2 years ago');
      expect(humanizeRelativeTime(now.subtract(Duration(days: 365)), now: now), '1 year ago');
    });
  });
}
