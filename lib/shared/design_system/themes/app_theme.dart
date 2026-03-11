import 'package:flutter/material.dart';
import '../tokens/app_colors.dart';

abstract final class AppTheme {
  static ThemeData light() {
    const colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: Colors.white,
      secondary: AppColors.secondary,
      onSecondary: Colors.white,
      tertiary: AppColors.accent,
      onTertiary: AppColors.textPrimary,
      error: AppColors.danger,
      onError: Colors.white,
      surface: AppColors.surface,
      onSurface: AppColors.textPrimary,
      onSurfaceVariant: AppColors.textSecondary,
      outline: Color(0xFFD8CCC6),
      outlineVariant: Color(0xFFE8DDD8),
      shadow: Colors.black,
      scrim: Colors.black,
      inverseSurface: AppColors.neutral900,
      onInverseSurface: Colors.white,
      inversePrimary: AppColors.accent,
    );

    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
    );
  }

  static ThemeData dark() {
    const colorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primary,
      onPrimary: Colors.white,
      secondary: AppColors.secondary,
      onSecondary: Colors.white,
      tertiary: AppColors.accent,
      onTertiary: Colors.black,
      error: AppColors.danger,
      onError: Colors.white,
      surface: AppColors.surfaceDark,
      onSurface: AppColors.textPrimaryDark,
      onSurfaceVariant: AppColors.textSecondaryDark,
      outline: Color(0xFF5A515B),
      outlineVariant: Color(0xFF453E47),
      shadow: Colors.black,
      scrim: Colors.black,
      inverseSurface: Colors.white,
      onInverseSurface: AppColors.textPrimary,
      inversePrimary: AppColors.primary,
    );

    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundDark,
        foregroundColor: AppColors.textPrimaryDark,
        elevation: 0,
      ),
    );
  }
}