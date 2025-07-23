import 'package:test/test.dart';
import 'package:human_readable_formats/humanize.dart';

void main() {
  group('humanizeCurrency', () {
    test('formats INR correctly', () {
      expect(humanizeCurrency(99), '₹99');
      expect(humanizeCurrency(1234), '₹1,234');
    });
    test('formats USD correctly', () {
      expect(humanizeCurrency(99, symbol: '\$', locale: 'en_US'), '\$99');
      expect(humanizeCurrency(1234, symbol: '\$', locale: 'en_US'), '\$1,234');
    });
  });
}
