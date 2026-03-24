import 'package:flutter/material.dart';

import '../../../../tokens/app_colors.dart';
import '../../../../tokens/app_spacing.dart';
import '../../../../tokens/app_typography.dart';

class PreferencesScreenPreview extends StatelessWidget {
  final bool isDarkMode;
  final bool isSystemMode;

  const PreferencesScreenPreview({
    super.key,
    this.isDarkMode = false,
    this.isSystemMode = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          Text(
            'Preferências',
            style: AppTypography.title.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.neutral100),
            ),
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text('Usar tema do sistema'),
                  subtitle: const Text('O app acompanha a configuração do dispositivo.'),
                  value: isSystemMode,
                  onChanged: (_) {}, // Fica estático no preview
                ),
                const Divider(height: 1),
                SwitchListTile(
                  title: const Text('Tema escuro'),
                  subtitle: Text(isSystemMode 
                    ? 'Desative o tema do sistema para escolher manualmente.' 
                    : 'Ative para usar o modo escuro.'),
                  value: isDarkMode,
                  onChanged: isSystemMode ? null : (_) {}, 
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}