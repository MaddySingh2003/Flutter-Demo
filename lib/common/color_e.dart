import 'package:flutter/material.dart';

class TableColor {
  static Color get primaryColor1 => const Color.fromARGB(121, 248, 178, 238);
  static Color get primaryColor2 => const Color.fromARGB(255, 131, 162, 238);
  static Color get primaryColor3 => const Color.fromARGB(255, 203, 149, 245);
  static Color get primaryColor4 => const Color.fromARGB(255, 255, 181, 246);
  static List<Color> get prime => [primaryColor1, primaryColor2];
  static List<Color> get secondry => [primaryColor3, primaryColor4];
  static List<Color> get third => [white, white];
  static List<Color> get four => [primaryColor3, primaryColor4];

  static Color get black => const Color(0xff1d1617);
  static Color get gray => const Color(0xff786F72);
  static Color get white => Colors.white;
  static Color get lightGrey => const Color(0xffF7F9F8);
}
