import 'package:flutter/material.dart';

class AppColorPalette {
  static Color primarycolor = const Color(0xFF435ebe);
  static Color secendarycolor = Colors.white;
  static Color leapcolor = const Color(0xFF87CEEB);
  static final Shader textGradient = const LinearGradient(
    colors: [
      Color.fromARGB(255, 135, 24, 245),
      Color.fromARGB(255, 154, 11, 173)
    ],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 250.0, 60.0));
  static final Shader white = const LinearGradient(
    colors: [
      Colors.white,
      Colors.white,
    ],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 250.0, 60.0));
}
