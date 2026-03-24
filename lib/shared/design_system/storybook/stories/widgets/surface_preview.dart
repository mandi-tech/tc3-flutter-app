import 'package:flutter/material.dart';
import '../../../tokens/app_colors.dart';
import '../../../tokens/app_spacing.dart';

class SurfacePreview extends StatelessWidget {
  final Widget child;
  final double maxWidth;

  const SurfacePreview({
    super.key, 
    required this.child,
    this.maxWidth = 400,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Container(
          constraints: BoxConstraints(maxWidth: maxWidth),
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: AppColors.neutral100,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.secondary.withOpacity(0.08),
                blurRadius: 24,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: IntrinsicHeight(child: child),
        ),
      ),
    );
  }
}