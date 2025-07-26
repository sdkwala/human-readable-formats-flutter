import 'package:human_readable_formats/src/ratio.dart';
import 'package:test/test.dart';

void main() {
  group('humanizeRatio', () {
    test('formats a simple ratio', () {
      expect(humanizeRatio(3, 4), '3 out of 4');
    });

    test('formats a ratio with zero part', () {
      expect(humanizeRatio(0, 5), '0 out of 5');
    });

    test('formats a ratio with equal parts', () {
      expect(humanizeRatio(10, 10), '10 out of 10');
    });

    test('formats a ratio with double values', () {
      expect(humanizeRatio(2.5, 5.0), '2.5 out of 5.0');
    });

    test('throws ArgumentError when total is zero', () {
      expect(() => humanizeRatio(3, 0), throwsArgumentError);
    });

    group('Localization', () {
      test('uses English by default', () {
        expect(humanizeRatio(3, 4), '3 out of 4');
      });

      test('uses Spanish when locale is provided', () {
        expect(humanizeRatio(3, 4, locale: 'es'), '3 de 4');
      });
    });
  });
}
