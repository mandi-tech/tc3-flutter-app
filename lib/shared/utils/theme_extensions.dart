import 'package:flutter/material.dart';

extension ThemeContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colors => theme.colorScheme;

  TextTheme get texts => theme.textTheme;

  bool get isDark => theme.brightness == Brightness.dark;
}