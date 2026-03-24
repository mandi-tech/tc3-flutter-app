import 'package:flutter/material.dart';

import '../../../../../utils/theme_extensions.dart';
import '../../../../tokens/app_colors.dart';
import '../../../../tokens/app_spacing.dart';
import '../../../../tokens/app_typography.dart';
import 'token_card.dart';

class SpacingTile extends StatelessWidget {
  final String name;
  final double value;

  const SpacingTile({
    super.key,
    required this.name,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return TokenCard(
      child: Row(
        children: [
          Container(
            width: value * 4,
            height: 16,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Text(
            '$name ($value px)',
            style: AppTypography.body.copyWith(
              color: context.colors.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}