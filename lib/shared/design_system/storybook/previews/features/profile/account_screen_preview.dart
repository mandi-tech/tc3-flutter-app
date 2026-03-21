import 'package:flutter/material.dart';

import '../../../../../utils/theme_extensions.dart';
import '../../../../tokens/app_colors.dart';
import '../../../../tokens/app_spacing.dart';
import '../../../../tokens/app_typography.dart';
import '../../widgets/settings_card_preview.dart';

class AccountScreenPreview extends StatelessWidget {
  const AccountScreenPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
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
                  _buildInfoField(
                    context,
                    label: 'Nome',
                    value: 'Isabelle Ribeiro',
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  _buildInfoField(
                    context,
                    label: 'E-mail',
                    value: 'isabelle@email.com',
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
        ),
      ),
    );
  }

  Widget _buildInfoField(BuildContext context,
      {required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.caption.copyWith(
            color: context.colors.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          value,
          style: AppTypography.body.copyWith(
            color: context.colors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}