import 'package:flutter/material.dart';

import '../tokens/app_spacing.dart';

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
        return Theme.of(context).colorScheme.primary;
      case AppButtonVariant.secondary:
        return Colors.grey.shade300;
      case AppButtonVariant.danger:
        return Colors.red;
    }
  }

  Color _foregroundColor() {
    switch (variant) {
      case AppButtonVariant.primary:
        return Colors.white;
      case AppButtonVariant.secondary:
        return Colors.black;
      case AppButtonVariant.danger:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: enabled && !isLoading ? onPressed : null,
      style: FilledButton.styleFrom(
        backgroundColor: _backgroundColor(context),
        foregroundColor: _foregroundColor(),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.sm,
          horizontal: AppSpacing.lg,
        ),
        child: isLoading
            ? const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : Text(label),
      ),
    );
  }
}