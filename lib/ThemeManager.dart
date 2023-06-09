import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager {
  static final String _isDarkModeKey = 'isDarkMode';

  static Future<bool> isDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isDarkModeKey) ?? false;
  }

  static Future<void> setDarkMode(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_isDarkModeKey, value);
  }

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blueGrey,
  );

  static Future<ThemeData> currentTheme() async {
    final isDark = await isDarkMode();
    return isDark ? darkTheme : lightTheme;
  }

  static ThemeData getThemeFromBrightness(Brightness brightness) {
    return brightness == Brightness.dark ? darkTheme : lightTheme;
  }
}