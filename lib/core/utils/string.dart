/// An extension on the String class to provide custom utilities.
extension StringExtension on String {
  /// Converts the first character of the string to uppercase and the rest to lowercase.
  ///
  /// Example:
  /// ```dart
  /// print('hello'.toCapitalized()); // Output: Hello
  /// ```
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  /// Converts the first character of each word in the string to uppercase and the rest to lowercase.
  ///
  /// Example:
  /// ```dart
  /// print('hello world'.toTitleCase()); // Output: Hello World
  /// ```
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
