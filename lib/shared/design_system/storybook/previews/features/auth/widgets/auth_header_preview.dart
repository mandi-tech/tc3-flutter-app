import 'package:flutter/material.dart';

import '../../../../../../utils/theme_extensions.dart';
import '../../../../../tokens/app_colors.dart';
import '../../../../../tokens/app_spacing.dart';
import '../../../../../tokens/app_typography.dart';

class AuthHeaderPreview extends StatelessWidget {
  final String title;
  final String description;

  const AuthHeaderPreview({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.xl,
        horizontal: AppSpacing.lg,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withOpacity(0.18),
            AppColors.primary.withOpacity(0.08),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: AppTypography.title.copyWith(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: context.colors.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            description,
            style: AppTypography.body.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}