import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../../utils/theme_extensions.dart';
import '../../tokens/app_colors.dart';
import '../../tokens/app_spacing.dart';
import '../../tokens/app_typography.dart';

final List<Story> tokenStories = [
  Story(
    name: 'Tokens/Colors',
    description: 'Paleta do Design System.',
    builder: (_) => const _ColorsStory(),
  ),
  Story(
    name: 'Tokens/Typography',
    description: 'Estilos tipográficos do Design System.',
    builder: (_) => const _TypographyStory(),
  ),
  Story(
    name: 'Tokens/Spacing',
    description: 'Escala de espaçamento do Design System.',
    builder: (_) => const _SpacingStory(),
  ),
];

class _ColorsStory extends StatelessWidget {
  const _ColorsStory();

  @override
  Widget build(BuildContext context) {
    final colors = <_ColorItem>[
      const _ColorItem('Primary', AppColors.primary),
      const _ColorItem('Secondary', AppColors.secondary),
      const _ColorItem('Accent', AppColors.accent),

      _ColorItem('Background (theme)', context.theme.scaffoldBackgroundColor),
      _ColorItem('Surface (theme)', context.colors.surface),
      _ColorItem('On Surface (theme)', context.colors.onSurface),
      _ColorItem(
        'On Surface Variant (theme)',
        context.colors.onSurfaceVariant,
      ),
      _ColorItem('Outline Variant (theme)', context.colors.outlineVariant),

      const _ColorItem('Success', AppColors.success),
      const _ColorItem('Warning', AppColors.warning),
      const _ColorItem('Danger', AppColors.danger),
      const _ColorItem('Income', AppColors.income),
      const _ColorItem('Expense', AppColors.expense),

      const _ColorItem('Neutral 0', AppColors.neutral0),
      const _ColorItem('Neutral 100', AppColors.neutral100),
      const _ColorItem('Neutral 900', AppColors.neutral900),
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(AppSpacing.md),
      itemCount: colors.length,
      separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.md),
      itemBuilder: (_, index) {
        final item = colors[index];
        final textColor = _useDarkText(item.color)
            ? Colors.black
            : Colors.white;

        return Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: item.color,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: context.colors.outlineVariant,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  item.name,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Text(
                _toHex(item.color),
                style: TextStyle(
                  color: textColor.withOpacity(0.9),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  bool _useDarkText(Color color) => color.computeLuminance() > 0.6;

  String _toHex(Color color) {
    return '#${color.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}';
  }
}

class _ColorItem {
  final String name;
  final Color color;

  const _ColorItem(this.name, this.color);
}

class _TypographyStory extends StatelessWidget {
  const _TypographyStory();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      children: const [
        _TypographyItem(
          name: 'Title',
          style: AppTypography.title,
          text: 'Título do aplicativo',
        ),
        SizedBox(height: AppSpacing.lg),
        _TypographyItem(
          name: 'Body',
          style: AppTypography.body,
          text: 'Este é um exemplo de texto padrão do aplicativo.',
        ),
        SizedBox(height: AppSpacing.lg),
        _TypographyItem(
          name: 'Caption',
          style: AppTypography.caption,
          text: 'Texto auxiliar ou legenda.',
        ),
      ],
    );
  }
}

class _TypographyItem extends StatelessWidget {
  final String name;
  final TextStyle style;
  final String text;

  const _TypographyItem({
    required this.name,
    required this.style,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: context.colors.outlineVariant,
        ),
      ),
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
          Text(
            text,
            style: style.copyWith(
              color: context.colors.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}

class _SpacingStory extends StatelessWidget {
  const _SpacingStory();

  @override
  Widget build(BuildContext context) {
    final spacings = [
      ('xs', AppSpacing.xs),
      ('sm', AppSpacing.sm),
      ('md', AppSpacing.md),
      ('lg', AppSpacing.lg),
      ('xl', AppSpacing.xl),
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(AppSpacing.lg),
      itemCount: spacings.length,
      separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.md),
      itemBuilder: (_, index) {
        final item = spacings[index];

        return Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: context.colors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: context.colors.outlineVariant,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: item.$2 * 4,
                height: 16,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Text(
                '${item.$1}  (${item.$2}px)',
                style: AppTypography.body.copyWith(
                  color: context.colors.onSurface,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}