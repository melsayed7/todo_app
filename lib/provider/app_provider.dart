import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  String appLanguage = 'en';

  ThemeMode appTheme = ThemeMode.light;

  void changeLanguage(String newLanguage) {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    notifyListeners();
  }

  void changeTheme(ThemeMode newTheme) {
    if (appTheme == newTheme) {
      return;
    }
    appTheme = newTheme;
    notifyListeners();
  }

  bool isDarkTheme() {
    return appTheme == ThemeMode.dark;
  }
}
