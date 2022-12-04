import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class AppProvider extends ChangeNotifier {
  String appLanguage = saveLanguage;

  ThemeMode appTheme = saveTheme;

  Future<void> changeLanguage(String newLanguage) async {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', appLanguage);
    notifyListeners();
  }

  Future<void> changeTheme(ThemeMode newTheme) async {
    if (appTheme == newTheme) {
      return;
    }
    appTheme = newTheme;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'theme', appTheme == ThemeMode.light ? 'light' : 'dark');
    notifyListeners();
  }

  bool isDarkTheme() {
    return appTheme == ThemeMode.dark;
  }
}
