import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../../../../utils/theme_extensions.dart';
import '../../../../tokens/app_colors.dart';
import '../../../../tokens/app_spacing.dart';
import '../../../../tokens/app_typography.dart';
import '../../widgets/story_preview_frame.dart';
import '../../../previews/widgets/settings_card_preview.dart';

final List<Story> accountScreenStories = [
  Story(
    name: 'Screens/Account Screen',
    description: 'Tela de dados da conta.',
    builder: (_) => const StoryPreviewFrame(
      width: 390,
      title: 'Account Screen',
      child: _AccountScreenPreview(),
    ),
  ),
];

class _AccountScreenPreview extends StatelessWidget {
  const _AccountScreenPreview();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Dados da conta',
            style: AppTypography.title.copyWith(
              color: context.colors.onSurface,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: context.colors.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: context.colors.outlineVariant,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nome',
                style: AppTypography.caption.copyWith(
                  color: context.colors.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Isabelle Ribeiro',
                style: AppTypography.body.copyWith(
                  color: context.colors.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                'E-mail',
                style: AppTypography.caption.copyWith(
                  color: context.colors.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'isabelle@email.com',
                style: AppTypography.body.copyWith(
                  color: context.colors.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        SettingsCardPreview(
          child: ListTile(
            leading: const Icon(
              Icons.lock_outline_rounded,
              color: AppColors.secondary,
            ),
            title: Text(
              'Alterar senha',
              style: AppTypography.body.copyWith(
                color: context.colors.onSurface,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}