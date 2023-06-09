import 'package:flutter/material.dart';

class SettingsViewModel extends ChangeNotifier {
  bool isDarkMode = false;
  String selectedLanguage = 'English';

  void toggleDarkMode(bool value) {
    isDarkMode = value;
    notifyListeners();
  }

  void changeLanguage(String value) {
    selectedLanguage = value;
    notifyListeners();
  }
}