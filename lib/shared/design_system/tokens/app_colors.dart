import 'package:flutter/material.dart';

abstract final class AppColors {
  /// Brand
  static const primary = Color(0xFFC06C84);
  static const secondary = Color(0xFF6C5B7B);
  static const accent = Color(0xFFF8B195);

  /// Financial semantics
  static const income = Color(0xFF2E9F7E);
  static const expense = Color(0xFFD64550);

  /// Feedback
  static const success = Color(0xFF3FAE88);
  static const warning = Color(0xFFF59E0B);
  static const danger = Color(0xFFD64550);

  /// Light
  static const background = Color(0xFFFFF8F5);
  static const surface = Color(0xFFFFFFFF);

  /// Dark
  static const backgroundDark = Color(0xFF1F1B20);
  static const surfaceDark = Color(0xFF2A252B);

  /// Neutrals
  static const neutral0 = Color(0xFFFFFFFF);
  static const neutral100 = Color(0xFFF5EDE9);
  static const neutral900 = Color(0xFF2E2A30);

  /// Text light
  static const textPrimary = Color(0xFF2E2A30);
  static const textSecondary = Color(0xFF6B6570);

  /// Text dark
  static const textPrimaryDark = Color(0xFFF4EDF4);
  static const textSecondaryDark = Color(0xFFCAC4D0);

  /// Chart palette (brand based)
  static const List<Color> categorySwatch = [
    Color(0xFFC06C84), // primary
    Color(0xFF6C5B7B), // secondary
    Color(0xFFF8B195), // accent
    Color(0xFFD9899B), // primary light
    Color(0xFF8C7A9E), // secondary light
    Color(0xFFE7A98C), // accent muted
    Color(0xFF9F536A), // primary dark
  ];
}