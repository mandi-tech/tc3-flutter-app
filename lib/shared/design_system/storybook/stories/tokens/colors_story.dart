import 'package:flutter/material.dart';

import '../../../tokens/app_colors.dart';
import '../../../tokens/app_spacing.dart';
import '../../../../utils/theme_extensions.dart';

import 'models/color_item.dart';
import 'widgets/color_swatch_tile.dart';

class ColorsStory extends StatelessWidget {
  const ColorsStory({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = <ColorItem>[
      const ColorItem('Primary', AppColors.primary),
      const ColorItem('Secondary', AppColors.secondary),
      const ColorItem('Accent', AppColors.accent),

      ColorItem('Background (theme)', context.theme.scaffoldBackgroundColor),
      ColorItem('Surface (theme)', context.colors.surface),
      ColorItem('On Surface (theme)', context.colors.onSurface),
      ColorItem('On Surface Variant (theme)', context.colors.onSurfaceVariant),
      ColorItem('Outline Variant (theme)', context.colors.outlineVariant),

      const ColorItem('Success', AppColors.success),
      const ColorItem('Warning', AppColors.warning),
      const ColorItem('Danger', AppColors.danger),
      const ColorItem('Income', AppColors.income),
      const ColorItem('Expense', AppColors.expense),

      const ColorItem('Neutral 0', AppColors.neutral0),
      const ColorItem('Neutral 100', AppColors.neutral100),
      const ColorItem('Neutral 900', AppColors.neutral900),
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(AppSpacing.md),
      itemCount: colors.length,
      separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.md),
      itemBuilder: (_, index) => ColorSwatchTile(item: colors[index]),
    );
  }
}