import 'package:flutter/material.dart';

import '../../../../app/app.dart';
import '../../../../shared/design_system/tokens/app_colors.dart';
import '../../../../shared/design_system/tokens/app_spacing.dart';
import '../../../../shared/design_system/tokens/app_typography.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = App.of(context);

    return AnimatedBuilder(
      animation: themeController,
      builder: (context, _) {
        final theme = Theme.of(context);

        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          appBar: AppBar(
            title: const Text('Perfil'),
          ),
          body: ListView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            children: [
              Text(
                'Preferências',
                style: AppTypography.title.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.neutral100,
                  ),
                ),
                child: Column(
                  children: [
                    SwitchListTile(
                      title: const Text('Usar tema do sistema'),
                      subtitle: const Text(
                        'O app acompanha a configuração do dispositivo.',
                      ),
                      value: themeController.isSystemMode,
                      onChanged: themeController.toggleSystemMode,
                    ),
                    const Divider(height: 1),
                    SwitchListTile(
                      title: const Text('Tema escuro'),
                      subtitle: Text(
                        themeController.isSystemMode
                            ? 'Desative o tema do sistema para escolher manualmente.'
                            : 'Ative para usar o modo escuro.',
                      ),
                      value: themeController.isDarkMode,
                      onChanged: themeController.isSystemMode
                          ? null
                          : themeController.toggleDarkMode,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
