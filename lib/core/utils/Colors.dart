import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF622EDC);
  static const Color secondary = Color(0xFFDEE2E6);
  static const Color accent = Color(0xFFFF930A);

  static MaterialColor get primarySwatch => _createMaterialColor(primary);
  static MaterialColor get secondarySwatch => _createMaterialColor(secondary);
  static MaterialColor get accentSwatch => _createMaterialColor(accent);

  static MaterialColor _createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
