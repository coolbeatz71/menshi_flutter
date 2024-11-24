import 'package:flutter/material.dart';

/// A utility class that provides a set of predefined colorscheme and their corresponding
/// MaterialColor swatches for use throughout the application.
class AppColors {
  static const Color primary = Color(0xFF622EDC);
  static const Color secondary = Color(0xFFDEE2E6);
  static const Color accent = Color(0xFFFF930A);

  static const Color error = Color(0xFFEE055E);
  static const Color warning = Color(0xFFFFBF47);
  static const Color success = Color(0xFF08B06F);

  static const Color backgroundLight = Color(0xFFDEE2E6);
  static const Color backgroundDark = Color(0xFF1B263B);

  static MaterialColor get primarySwatch => _createMaterialColor(primary);
  static MaterialColor get secondarySwatch => _createMaterialColor(secondary);
  static MaterialColor get accentSwatch => _createMaterialColor(accent);
  static MaterialColor get errorSwatch => _createMaterialColor(error);
  static MaterialColor get warningSwatch => _createMaterialColor(warning);
  static MaterialColor get successSwatch => _createMaterialColor(success);
  static MaterialColor get backgroundLightSwatch => _createMaterialColor(backgroundLight);
  static MaterialColor get backgroundDarkSwatch => _createMaterialColor(backgroundDark);

  /// Creates a MaterialColor swatch from a given [color].
  ///
  /// The swatch is created by varying the strength of the color to generate
  /// different shades.
  ///
  /// - Parameter color: The base color to create the swatch from.
  /// - Returns: A MaterialColor swatch with different shades of the base color.
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
