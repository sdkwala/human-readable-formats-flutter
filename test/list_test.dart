import 'package:test/test.dart';
import 'package:human_readable_formats/humanize.dart';

void main() {
  group('humanizeList', () {
    test('handles empty list', () {
      expect(humanizeList([]), '');
    });
    
    test('handles single item', () {
      expect(humanizeList(['apple']), 'apple');
    });
    
    test('handles two items', () {
      expect(humanizeList(['red', 'blue']), 'red and blue');
      expect(humanizeList(['cats', 'dogs'], conjunction: 'or'), 'cats or dogs');
    });
    
    test('handles three or more items with Oxford comma', () {
      expect(humanizeList(['apples', 'bananas', 'oranges']), 'apples, bananas, and oranges');
      expect(humanizeList(['red', 'green', 'blue', 'yellow']), 'red, green, blue, and yellow');
    });
    
    test('handles three or more items without Oxford comma', () {
      expect(humanizeList(['apples', 'bananas', 'oranges'], oxfordComma: false), 'apples, bananas and oranges');
      expect(humanizeList(['red', 'green', 'blue'], oxfordComma: false), 'red, green and blue');
    });
    
    test('supports different conjunctions', () {
      expect(humanizeList(['tea', 'coffee', 'juice'], conjunction: 'or'), 'tea, coffee, or juice');
      expect(humanizeList(['fast', 'slow'], conjunction: 'or'), 'fast or slow');
    });
  });
}
