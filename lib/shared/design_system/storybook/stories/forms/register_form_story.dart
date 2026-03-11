import 'package:flutter/material.dart';

import '../../../components/app_button.dart';
import '../../../components/app_email_field.dart';
import '../../../components/app_password_field.dart';
import '../../../components/app_text_field.dart';
import '../../../tokens/app_colors.dart';
import '../../../tokens/app_spacing.dart';

class RegisterFormStory extends StatelessWidget {
  const RegisterFormStory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppTextField(
          label: 'Nome completo',
          hintText: 'Digite seu nome completo',
          prefixIcon: const Icon(
            Icons.person_outline_rounded,
            color: AppColors.secondary,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        const AppEmailField(),
        const SizedBox(height: AppSpacing.md),
        const AppPasswordField(),
        const SizedBox(height: AppSpacing.md),
        const AppPasswordField(
          label: 'Confirmar senha',
          hintText: 'Digite sua senha novamente',
        ),
        const SizedBox(height: AppSpacing.lg),
        const AppButton(
          label: 'Criar conta',
          onPressed: null,
        ),
        const SizedBox(height: AppSpacing.sm),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Já tenho conta',
            style: TextStyle(
              color: AppColors.secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}