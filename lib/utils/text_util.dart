import 'dart:convert';

class TextUtil {
  static String utf8convert(String text) {
    final List<int> bytes = text.toString().codeUnits;

    return utf8.decode(bytes);
  }
}
