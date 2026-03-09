import 'package:flutter/material.dart';

import '../../../../shared/design_system/tokens/app_colors.dart';
import '../../../../shared/design_system/tokens/app_spacing.dart';
import '../../../../shared/design_system/tokens/app_typography.dart';
import '../widgets/settings_card.dart';
import '../widgets/settings_item.dart';
import 'acount_screen.dart';
import 'preferences_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          // Detalhes da conta
          Text(
            'Conta',
            style: AppTypography.title,
          ),

          const SizedBox(height: AppSpacing.md),

          SettingsCard(
            children: [
              SettingsItem(
                icon: Icons.person_outline,
                label: 'Dados da conta',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AccountScreen(),
                    ),
                  );
                },
              ),
            ],
          ),

          const SizedBox(height: AppSpacing.xl),

          // Preferências
          Text(
            'Preferências',
            style: AppTypography.title,
          ),

          const SizedBox(height: AppSpacing.md),

          SettingsCard(
            children: [
              SettingsItem(
                icon: Icons.palette_outlined,
                label: 'Tema',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PreferencesScreen(),
                    ),
                  );
                },
              ),
            ],
          ),

          const SizedBox(height: AppSpacing.xl),

          /// Logout
          SettingsCard(
            children: [
              SettingsItem(
                icon: Icons.logout,
                label: 'Sair',
                textColor: AppColors.danger,
                iconColor: AppColors.danger,
                onTap: () {
                  /// TO DO: conectar com auth
                  print("logout");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}