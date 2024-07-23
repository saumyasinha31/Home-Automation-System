import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  bool _isDarkTheme;

  ThemeNotifier(this._isDarkTheme);

  bool get isDarkTheme => _isDarkTheme;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
    _saveThemeToPreferences();
  }

  void setDarkTheme(bool value) {
    _isDarkTheme = value;
    notifyListeners();
    _saveThemeToPreferences();
  }

  void _saveThemeToPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkTheme', _isDarkTheme);
  }
}
