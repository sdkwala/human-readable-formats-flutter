import 'package:test/test.dart';
import 'package:human_readable_formats/humanize.dart';

void main() {
  group('humanizePercentage', () {
    test('formats fractional values', () {
      expect(humanizePercentage(0.985), '98.5%');
      expect(humanizePercentage(1, isFraction: true), '100%');
      expect(humanizePercentage(0, isFraction: true), '0%');
      expect(humanizePercentage(0.1234, isFraction: true, decimalPlaces: 2), '12.34%');
    });
    test('formats percent values directly', () {
      expect(humanizePercentage(98.5, isFraction: false), '98.5%');
      expect(humanizePercentage(100, isFraction: false), '100%');
      expect(humanizePercentage(0, isFraction: false), '0%');
    });
    test('removes trailing zeros', () {
      expect(humanizePercentage(0.5), '50%');
      expect(humanizePercentage(0.505, decimalPlaces: 2), '50.5%');
      expect(humanizePercentage(0.500, decimalPlaces: 2), '50%');
    });
    test('supports custom decimal places', () {
      expect(humanizePercentage(0.123456, decimalPlaces: 3), '12.346%');
      expect(humanizePercentage(0.1, decimalPlaces: 2), '10%');
    });
  });
}
