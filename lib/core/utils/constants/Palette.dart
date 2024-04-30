import 'package:flutter/material.dart';

class Palette {
  Palette._();

  static const Color main = Color.fromARGB(255, 248, 246, 227);
  static const Color primary = Color.fromARGB(143, 151, 231, 226);
  //light theme
  static const Color primaryLight = Color(0xffffffff);
  static const Color secondaryLight = Color.fromARGB(255, 151, 231, 225);
  static const Color textLight = Color.fromARGB(255, 53, 53, 53);

  //dark theme
  static const Color primaryDark = Color.fromARGB(255, 37, 37, 37);
  static const Color secondaryDark = Color.fromARGB(255, 122, 162, 227);
  static const Color textDark = Color.fromARGB(255, 247, 247, 247);

  //calendar
  static const Color primaryAccent = Color.fromARGB(255, 122, 162, 227);
  static const Color secondaryAccent = Color.fromARGB(255, 106, 212, 221);
}
