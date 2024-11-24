import 'dart:ui';
import 'package:flutter/widgets.dart';

/// An extension on BuildContext to determine if the current theme is dark mode.
extension DarkMode on BuildContext {
  /// A getter that returns true if the current theme is dark mode, false otherwise.
  ///
  /// This getter uses the MediaQuery.of method to obtain the platformBrightness
  /// of the current context. If the brightness is Brightness.dark, it returns true,
  /// indicating that the current theme is dark mode. Otherwise, it returns false.
  ///
  /// Example usage:
  /// ```dart
  /// bool isDark = context.isDarkMode;
  /// ```
  bool get isDarkMode {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }
}
