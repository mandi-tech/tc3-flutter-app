import 'package:flutter/material.dart';

abstract final class AppColors {
  /// Brand
  static const primary = Color(0xFFC06C84); // Dusty Rose
  static const secondary = Color(0xFF6C5B7B); // Mauve
  static const accent = Color(0xFFF8B195); // Peach

  /// Feedback
  static const success = Color(0xFF3FAE88);
  static const warning = Color(0xFFF59E0B);
  static const danger  = Color(0xFFD64550);

  /// Backgrounds / Surfaces
  static const background = Color(0xFFFFF8F5); // Soft Cream
  static const surface = Color(0xFFFFFFFF);

  /// Neutrals
  static const neutral0   = Color(0xFFFFFFFF);
  static const neutral100 = Color(0xFFF5EDE9);
  static const neutral900 = Color(0xFF2E2A30);

  /// Text
  static const textPrimary = Color(0xFF2E2A30);
  static const textSecondary = Color(0xFF6B6570);
}