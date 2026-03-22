import 'package:flutter/material.dart';

import '../../../../../utils/theme_extensions.dart';
import '../../../../tokens/app_spacing.dart';
import '../../../../tokens/app_typography.dart';
import '../../widgets/settings_card_preview.dart';

class ProfileScreenPreview extends StatelessWidget {
  const ProfileScreenPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Perfil',
              style: AppTypography.title.copyWith(
                color: context.colors.onSurface,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            _buildSectionTitle(context, 'Conta'),
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
            _buildSectionTitle(context, 'Preferências'),
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
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: AppTypography.title.copyWith(
        color: context.colors.onSurface,
        fontSize: 18,
      ),
    );
  }
}