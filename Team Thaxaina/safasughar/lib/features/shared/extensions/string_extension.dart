extension StringExt on String {
  /// Capitalize the first letter of the string.
  String get capitalizeFirstLetter {
    if (isEmpty) return '';
    final lower = toLowerCase();
    return lower[0].toUpperCase() + lower.substring(1);
  }
}
