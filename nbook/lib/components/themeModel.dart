import 'package:flutter/material.dart';
import 'package:nbook/components/theme_shared.dart';

class ThemeModel extends ChangeNotifier {
  late bool _isDark;
  late ThemeSharedPrefrences themeSharedPrefrences;
  bool get isDark => _isDark;

  ThemeModel() {
    _isDark = false;
    themeSharedPrefrences = ThemeSharedPrefrences();
    getThemePrefrences();
  }

  set isDark(bool value) {
    _isDark = value;
    themeSharedPrefrences.setTheme(value);
    notifyListeners();
  }

  getThemePrefrences() async {
    _isDark = await themeSharedPrefrences.getTheme();
    notifyListeners();
  }
}
