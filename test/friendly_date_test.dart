import 'package:test/test.dart';
import 'package:human_readable_formats/humanize.dart';

void main() {
  group('humanizeFriendlyDate', () {
    final now = DateTime(2025, 7, 21); // Monday
    
    test('formats today', () {
      expect(humanizeFriendlyDate(now, now: now), 'Today');
    });
    
    test('formats yesterday', () {
      final yesterday = now.subtract(Duration(days: 1));
      expect(humanizeFriendlyDate(yesterday, now: now), 'Yesterday');
    });
    
    test('formats tomorrow', () {
      final tomorrow = now.add(Duration(days: 1));
      expect(humanizeFriendlyDate(tomorrow, now: now), 'Tomorrow');
    });
    
    test('formats last week days', () {
      final lastFriday = now.subtract(Duration(days: 3)); // Friday (3 days ago)
      final lastThursday = now.subtract(Duration(days: 4)); // Thursday (4 days ago)
      expect(humanizeFriendlyDate(lastFriday, now: now), 'Last Friday');
      expect(humanizeFriendlyDate(lastThursday, now: now), 'Last Thursday');
    });
    
    test('formats next week days', () {
      final nextWednesday = now.add(Duration(days: 2)); // Wednesday (2 days ahead)
      final nextThursday = now.add(Duration(days: 3)); // Thursday (3 days ahead)
      expect(humanizeFriendlyDate(nextWednesday, now: now), 'Next Wednesday');
      expect(humanizeFriendlyDate(nextThursday, now: now), 'Next Thursday');
    });
    
    test('formats distant dates', () {
      final distantPast = DateTime(2024, 1, 15);
      final distantFuture = DateTime(2026, 12, 25);
      expect(humanizeFriendlyDate(distantPast, now: now), 'Jan 15, 2024');
      expect(humanizeFriendlyDate(distantFuture, now: now), 'Dec 25, 2026');
    });
  });
}
