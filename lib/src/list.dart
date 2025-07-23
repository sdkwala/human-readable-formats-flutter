/// Formats a list of items into a human-readable enumeration string.
/// Examples: 'apples, bananas, and oranges', 'red and blue', 'just one'
String humanizeList(List<String> items, {String conjunction = 'and', bool oxfordComma = true}) {
  if (items.isEmpty) return '';
  if (items.length == 1) return items.first;
  if (items.length == 2) return '${items[0]} $conjunction ${items[1]}';
  
  final lastItem = items.last;
  final allButLast = items.sublist(0, items.length - 1);
  final comma = oxfordComma ? ',' : '';
  
  return '${allButLast.join(', ')}$comma $conjunction $lastItem';
}
