import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../../../../utils/theme_extensions.dart';
import '../../../../tokens/app_spacing.dart';
import '../../../../tokens/app_typography.dart';
import '../../widgets/story_preview_frame.dart';
import '../../../previews/widgets/settings_card_preview.dart';

final List<Story> profileScreenStories = [
  Story(
    name: 'Screens/Profile Screen',
    description: 'Tela principal de perfil.',
    builder: (_) => const StoryPreviewFrame(
      width: 390,
      title: 'Profile Screen',
      child: _ProfileScreenPreview(),
    ),
  ),
];

class _ProfileScreenPreview extends StatelessWidget {
  const _ProfileScreenPreview();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Perfil',
          style: AppTypography.title.copyWith(
            color: context.colors.onSurface,
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          'Conta',
          style: AppTypography.title.copyWith(
            color: context.colors.onSurface,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        SettingsCardPreview(
          child: ListTile(
            leading: const Icon(Icons.person_outline_rounded),
            title: Text(
              'Dados da conta',
              style: AppTypography.body.copyWith(
                color: context.colors.onSurface,
              ),
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () {},
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        Text(
          'Preferências',
          style: AppTypography.title.copyWith(
            color: context.colors.onSurface,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        SettingsCardPreview(
          child: ListTile(
            leading: const Icon(Icons.palette_outlined),
            title: Text(
              'Tema',
              style: AppTypography.body.copyWith(
                color: context.colors.onSurface,
              ),
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () {},
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        SettingsCardPreview(
          child: ListTile(
            leading: Icon(
              Icons.logout_rounded,
              color: context.colors.error,
            ),
            title: Text(
              'Sair',
              style: AppTypography.body.copyWith(
                color: context.colors.error,
                fontWeight: FontWeight.w600,
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