import 'package:human_readable_formats/human_readable_formats.dart';
import 'package:intl/intl.dart';
import 'package:test/test.dart';

void main() {
  group('humanizeFriendlyDate', () {
    final now = DateTime(2025, 7, 21, 15, 45); // Monday at 3:45 PM
    final timeString = DateFormat.jm().format(now);

    group('without time', () {
      test('formats today', () {
        expect(humanizeFriendlyDate(now, now: now), 'Today');
      });

      test('formats yesterday', () {
        final yesterday = now.subtract(const Duration(days: 1));
        expect(humanizeFriendlyDate(yesterday, now: now), 'Yesterday');
      });

      test('formats last week days', () {
        final lastFriday = now.subtract(const Duration(days: 3));
        expect(humanizeFriendlyDate(lastFriday, now: now), 'Last Friday');
      });

      test('formats distant dates', () {
        final distantPast = DateTime(2024, 1, 15);
        expect(humanizeFriendlyDate(distantPast, now: now), 'Jan 15, 2024');
      });
    });

    group('with time', () {
      const includeTime = true;

      test('formats today with time', () {
        expect(
          humanizeFriendlyDate(now, now: now, includeTime: includeTime),
          'Today at $timeString',
        );
      });

      test('formats yesterday with time', () {
        final yesterday = now.subtract(const Duration(days: 1));
        expect(
          humanizeFriendlyDate(yesterday, now: now, includeTime: includeTime),
          'Yesterday at $timeString',
        );
      });

      test('formats last week days with time', () {
        final lastFriday = now.subtract(const Duration(days: 3));
        expect(
          humanizeFriendlyDate(lastFriday, now: now, includeTime: includeTime),
          'Last Friday at $timeString',
        );
      });

      test('formats distant dates with time', () {
        final distantPast = DateTime(2024, 1, 15, 10, 30);
        final distantTimeString = DateFormat.jm().format(distantPast);
        expect(
          humanizeFriendlyDate(distantPast, now: now, includeTime: includeTime),
          'Jan 15, 2024 at $distantTimeString',
        );
      });
    });

    group('Localization', () {
      test('uses English by default', () {
        expect(humanizeFriendlyDate(now, now: now), 'Today');
        final yesterday = now.subtract(const Duration(days: 1));
        expect(humanizeFriendlyDate(yesterday, now: now), 'Yesterday');
        final tomorrow = now.add(const Duration(days: 1));
        expect(humanizeFriendlyDate(tomorrow, now: now), 'Tomorrow');
      });

      test('uses Spanish when locale is provided', () {
        expect(humanizeFriendlyDate(now, now: now, locale: 'es'), 'Hoy');
        final yesterday = now.subtract(const Duration(days: 1));
        expect(humanizeFriendlyDate(yesterday, now: now, locale: 'es'), 'Ayer');
        final tomorrow = now.add(const Duration(days: 1));
        expect(humanizeFriendlyDate(tomorrow, now: now, locale: 'es'), 'Mañana');
      });

      test('uses Spanish with time conjunction', () {
        expect(
          humanizeFriendlyDate(now, now: now, includeTime: true, locale: 'es'),
          'Hoy a las $timeString',
        );
      });

      test('uses Spanish with relative days', () {
        final lastFriday = now.subtract(const Duration(days: 3));
        expect(
          humanizeFriendlyDate(lastFriday, now: now, locale: 'es'),
          'El Friday', // Note: weekday names would need separate localization
        );
        final nextWednesday = now.add(const Duration(days: 2));
        expect(
          humanizeFriendlyDate(nextWednesday, now: now, locale: 'es'),
          'El próximo Wednesday',
        );
      });
    });
  });
}

