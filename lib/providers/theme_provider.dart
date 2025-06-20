import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  static const String _themeKey = 'theme_mode';
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  ThemeProvider() {
    loadTheme();
  }

  void loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeIndex = prefs.getInt(_themeKey) ?? 2; // Default to System
    _themeMode = ThemeMode.values[themeIndex];
    notifyListeners();
  }

  void setTheme(ThemeMode themeMode) async {
    _themeMode = themeMode;
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(_themeKey, themeMode.index);
    notifyListeners();
  }

  // Updated logic to cycle through themes intelligently
  void cycleTheme(BuildContext context) {
    ThemeMode newThemeMode;
    if (_themeMode == ThemeMode.system) {
      // If current mode is System, determine the next mode based on the actual system brightness
      final brightness = MediaQuery.of(context).platformBrightness;
      newThemeMode =
          brightness == Brightness.dark ? ThemeMode.light : ThemeMode.dark;
    } else if (_themeMode == ThemeMode.light) {
      // If light, go to dark
      newThemeMode = ThemeMode.dark;
    } else {
      // If dark, go to system
      newThemeMode = ThemeMode.system;
    }
    setTheme(newThemeMode);
  }
}
