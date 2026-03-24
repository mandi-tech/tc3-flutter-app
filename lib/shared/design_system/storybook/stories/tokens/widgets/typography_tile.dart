import 'package:flutter/material.dart';

import '../../../../../utils/theme_extensions.dart';
import '../../../../tokens/app_spacing.dart';
import '../../../../tokens/app_typography.dart';
import 'token_card.dart';

class TypographyTile extends StatelessWidget {
  final String name;
  final TextStyle style;
  final String sampleText;

  const TypographyTile({
    super.key,
    required this.name,
    required this.style,
    required this.sampleText,
  });

  @override
  Widget build(BuildContext context) {
    return TokenCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: AppTypography.caption.copyWith(
              fontWeight: FontWeight.w600,
              color: context.colors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),

          /// Preview real da tipografia
          Text(
            sampleText,
            style: style.copyWith(
              color: context.colors.onSurface,
            ),
          ),

          const SizedBox(height: AppSpacing.sm),

          /// Informações do token
          Text(
            'fontSize: ${style.fontSize}  •  weight: ${style.fontWeight?.value}',
            style: AppTypography.caption.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}