import 'package:human_readable_formats/src/duration.dart';
import 'package:test/test.dart';

void main() {
  group('humanizeDuration', () {
    group('Short Style', () {
      test('formats a simple duration', () {
        final duration = Duration(hours: 1, minutes: 30);
        expect(humanizeDuration(duration), '1h 30m');
      });

      test('handles zero duration', () {
        expect(humanizeDuration(Duration.zero), '0μs');
      });
    });

    group('Long Style', () {
      test('formats with default conjunction', () {
        final duration = Duration(days: 1, hours: 5, minutes: 10);
        expect(humanizeDuration(duration, style: DurationTextStyle.long), '1 day, 5 hours, 10 minutes');
      });

      test('formats a two-part duration', () {
        final duration = Duration(hours: 1, minutes: 30);
        expect(humanizeDuration(duration, style: DurationTextStyle.long), '1 hour and 30 minutes');
      });

      test('formats a single-part duration', () {
        final duration = Duration(days: 2);
        expect(humanizeDuration(duration, style: DurationTextStyle.long), '2 days');
      });
    });

    group('Unit Limiting', () {
      test('limits the number of units displayed', () {
        final duration = Duration(days: 1, hours: 5, minutes: 10, seconds: 30);
        expect(humanizeDuration(duration, maxUnits: 2), '1d 5h');
        expect(humanizeDuration(duration, style: DurationTextStyle.long, maxUnits: 2), '1 day and 5 hours');
      });
    });

    group('Localization', () {
      test('uses English by default', () {
        final duration = Duration(days: 2, hours: 1);
        expect(humanizeDuration(duration, style: DurationTextStyle.long), '2 days and 1 hour');
      });

      test('uses Spanish when locale is provided', () {
        final duration = Duration(days: 2, hours: 1);
        expect(humanizeDuration(duration, style: DurationTextStyle.long, locale: 'es'), '2 días and 1 hora');
      });
    });
  });
}
