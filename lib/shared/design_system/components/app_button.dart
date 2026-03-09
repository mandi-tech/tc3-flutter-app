import 'package:flutter/material.dart';

import '../tokens/app_spacing.dart';
import '../../utils/theme_extensions.dart';

enum AppButtonVariant { primary, secondary, danger }

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool enabled;
  final bool isLoading;
  final AppButtonVariant variant;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.enabled = true,
    this.isLoading = false,
    this.variant = AppButtonVariant.primary,
  });

  Color _backgroundColor(BuildContext context) {
    switch (variant) {
      case AppButtonVariant.primary:
        return context.colors.primary;

      case AppButtonVariant.secondary:
        return context.colors.surface;

      case AppButtonVariant.danger:
        return context.colors.error;
    }
  }

  Color _foregroundColor(BuildContext context) {
    switch (variant) {
      case AppButtonVariant.primary:
        return context.colors.onPrimary;

      case AppButtonVariant.secondary:
        return context.colors.onSurface;

      case AppButtonVariant.danger:
        return context.colors.onError;
    }
  }

  BorderSide? _border(BuildContext context) {
    if (variant == AppButtonVariant.secondary) {
      return BorderSide(
        color: context.colors.outlineVariant,
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: enabled && !isLoading ? onPressed : null,
      style: FilledButton.styleFrom(
        backgroundColor: _backgroundColor(context),
        foregroundColor: _foregroundColor(context),
        side: _border(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.sm,
          horizontal: AppSpacing.lg,
        ),
        child: isLoading
            ? SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: _foregroundColor(context),
                ),
              )
            : Text(label),
      ),
    );
  }
}