import 'package:flutter/material.dart';

enum AppThemeMode {
  system,
  light,
  dark,
}

class ThemeController extends ChangeNotifier {
  AppThemeMode _themeMode = AppThemeMode.system;

  AppThemeMode get themeMode => _themeMode;

  ThemeMode get flutterThemeMode {
    switch (_themeMode) {
      case AppThemeMode.system:
        return ThemeMode.system;
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
    }
  }

  bool get isSystemMode => _themeMode == AppThemeMode.system;
  bool get isDarkMode => _themeMode == AppThemeMode.dark;

  void updateTheme(AppThemeMode mode) {
    if (_themeMode == mode) return;
    _themeMode = mode;
    notifyListeners();
  }

  void toggleSystemMode(bool value) {
    if (value) {
      updateTheme(AppThemeMode.system);
    } else {
      updateTheme(AppThemeMode.light);
    }
  }

  void toggleDarkMode(bool value) {
    updateTheme(value ? AppThemeMode.dark : AppThemeMode.light);
  }
}