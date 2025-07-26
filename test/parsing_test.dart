import 'package:test/test.dart';
import 'package:human_readable_formats/src/parsing.dart';

void main() {
  group('parseHumanSize', () {
    test('parses SI units', () {
      expect(parseHumanSize('1 KB'), 1000);
      expect(parseHumanSize('2.5 MB'), 2500000);
      expect(parseHumanSize('3 GB'), 3000000000);
      expect(parseHumanSize('1.5 TB'), 1500000000000);
    });

    test('parses IEC units', () {
      expect(parseHumanSize('1 KiB'), 1024);
      expect(parseHumanSize('2.5 MiB'), 2621440);
      expect(parseHumanSize('3 GiB'), 3221225472);
      expect(parseHumanSize('1.5 TiB'), 1649267441664);
    });

    test('parses bytes', () {
      expect(parseHumanSize('500 B'), 500);
      expect(parseHumanSize('0 B'), 0);
    });

    test('is case-insensitive and trims whitespace', () {
      expect(parseHumanSize(' 1.5 kib '), 1536);
      expect(parseHumanSize('2 mb'), 2000000);
      expect(parseHumanSize('3   GiB'), 3221225472);
    });

    test('throws on invalid input', () {
      expect(() => parseHumanSize('abc'), throwsFormatException);
      expect(() => parseHumanSize('10 XB'), throwsFormatException);
      expect(() => parseHumanSize(''), throwsFormatException);
    });
  });

  group('parseDuration', () {
    test('parses short units', () {
      expect(parseDuration('1h'), Duration(hours: 1));
      expect(parseDuration('2m 30s'), Duration(minutes: 2, seconds: 30));
      expect(parseDuration('45s'), Duration(seconds: 45));
      expect(parseDuration('100ms'), Duration(milliseconds: 100));
      expect(parseDuration('250us'), Duration(microseconds: 250));
    });

    test('parses long units', () {
      expect(parseDuration('1 hour'), Duration(hours: 1));
      expect(parseDuration('2 minutes 30 seconds'), Duration(minutes: 2, seconds: 30));
      expect(parseDuration('3 days'), Duration(days: 3));
      expect(parseDuration('1 year'), Duration(days: 365));
      expect(parseDuration('2 years 2 days'), Duration(days: 2 + 2 * 365));
    });

    test('parses mixed and decimal', () {
      expect(parseDuration('1.5h'), Duration(hours: 2)); // rounds up
      expect(parseDuration('1,5 hours'), Duration(hours: 2)); // comma as decimal
      expect(parseDuration('2.25m'), Duration(minutes: 2)); // rounds down
      expect(parseDuration('1h 30m 15s 500ms 250us'), Duration(hours: 1, minutes: 30, seconds: 15, milliseconds: 500, microseconds: 250));
    });

    test('is case-insensitive and trims whitespace', () {
      expect(parseDuration(' 1 HOUR  '), Duration(hours: 1));
      expect(parseDuration('2 DAYS'), Duration(days: 2));
      expect(parseDuration('5   sEc'), Duration(seconds: 5));
    });

    test('throws on invalid input', () {
      expect(() => parseDuration('abc'), throwsFormatException);
      expect(() => parseDuration('10 xy'), throwsFormatException);
      expect(() => parseDuration(''), throwsFormatException);
    });
  });
}
