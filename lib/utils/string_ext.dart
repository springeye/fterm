import 'dart:ui';

extension StringLocale on String {
  Locale toLocale() {
    var array = split("_");
    return Locale(array[0], array[1]);
  }
}
