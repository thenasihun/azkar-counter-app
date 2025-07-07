import 'package:flutter/material.dart';

class AppThemes {
  // --- LIGHT THEME ---
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF6F42C1),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'NotoNaskhArabic', // Set default font
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black87,
      elevation: 1,
    ),
    cardColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF7B61FF),
      secondary: Color(0xFF00ACC1),
      surface: Colors.white,
      onSurface: Color(0xFF333333),
      error: Colors.red,
      onPrimary: Colors.white
    ),
  );

  // --- DARK THEME ---
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFFBB86FC),
    scaffoldBackgroundColor: const Color(0xFF121212),
    fontFamily: 'NotoNaskhArabic', // Set default font
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1F1F1F),
      foregroundColor: Colors.white,
      elevation: 1,
    ),
    cardColor: const Color(0xFF1F1F1F),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFBB86FC),
      secondary: Color(0xFF03DAC6),
      surface: Color(0xFF1F1F1F),
      onSurface: Colors.white,
      error: Color(0xFFCF6679),
      onPrimary: Colors.black
    ),
  );
}
