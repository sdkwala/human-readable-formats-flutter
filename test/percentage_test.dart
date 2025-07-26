import 'package:human_readable_formats/src/percentage.dart';
import 'package:test/test.dart';

void main() {
  group('humanizePercentage', () {
    group('Fractional Values', () {
      test('formats fractions correctly', () {
        expect(humanizePercentage(0.75, decimalPlaces: 0), '75%');
        expect(humanizePercentage(0.752, decimalPlaces: 1), '75.2%');
        expect(humanizePercentage(1), '100%');
      });
    });

    group('Direct Percent Values', () {
      test('formats direct percentages correctly', () {
        expect(humanizePercentage(75, isFraction: false, decimalPlaces: 0), '75%');
        expect(humanizePercentage(75.2, isFraction: false, decimalPlaces: 1), '75.2%');
      });
    });

    group('Formatting Options', () {
      test('handles decimal places correctly', () {
        expect(humanizePercentage(0.12345, decimalPlaces: 2), '12.35%');
        expect(humanizePercentage(0.12345, decimalPlaces: 0), '12%');
      });

      test('removes unnecessary trailing zeros and decimal points when decimalPlaces is not specified', () {
        // When decimalPlaces is not specified, trailing zeros and decimal points are removed
        expect(humanizePercentage(0.75), '75%');
        expect(humanizePercentage(0.7500), '75%');
        expect(humanizePercentage(0.1), '10%');
        
        // When decimalPlaces is explicitly specified, it's respected exactly
        expect(humanizePercentage(0.75, decimalPlaces: 2), '75.00%');
        expect(humanizePercentage(0.1, decimalPlaces: 2), '10.00%');
      });
    });

    group('Edge Cases', () {
      test('handles zero correctly', () {
        expect(humanizePercentage(0), '0%');
        expect(humanizePercentage(0, isFraction: false), '0%');
      });

      test('throws ArgumentError for negative decimalPlaces', () {
        expect(() => humanizePercentage(0.5, decimalPlaces: -1), throwsArgumentError);
      });

      group('Localization', () {
        test('uses English by default', () {
          expect(humanizePercentage(0.985), '98.5%');
          expect(humanizePercentage(0.5, decimalPlaces: 0), '50%');
        });

        test('uses Spanish when locale is provided', () {
          // Percentage symbol is international, so it remains the same
          expect(humanizePercentage(0.985, locale: 'es'), '98.5%');
          expect(humanizePercentage(0.5, decimalPlaces: 0, locale: 'es'), '50%');
        });
      });
    });
  });
}
