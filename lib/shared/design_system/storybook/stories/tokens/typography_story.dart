import 'package:flutter/material.dart';

import '../../../tokens/app_spacing.dart';
import '../../../tokens/app_typography.dart';
import 'widgets/typography_tile.dart';

class TypographyStory extends StatelessWidget {
  const TypographyStory({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      children: const [
        TypographyTile(
          name: 'Title',
          style: AppTypography.title,
          sampleText: 'Título da página',
        ),
        SizedBox(height: AppSpacing.lg),
        TypographyTile(
          name: 'Subtitle',
          style: AppTypography.subtitle,
          sampleText: 'Subtítulo ou seção',
        ),
        SizedBox(height: AppSpacing.lg),
        TypographyTile(
          name: 'Body',
          style: AppTypography.body,
          sampleText:
              'Este é um exemplo de texto padrão usado para conteúdo principal do aplicativo.',
        ),
        SizedBox(height: AppSpacing.lg),
        TypographyTile(
          name: 'Caption',
          style: AppTypography.caption,
          sampleText: 'Texto auxiliar ou legenda.',
        ),
        SizedBox(height: AppSpacing.lg),
        TypographyTile(
          name: 'Button',
          style: AppTypography.button,
          sampleText: 'BOTÃO',
        ),
      ],
    );
  }
}