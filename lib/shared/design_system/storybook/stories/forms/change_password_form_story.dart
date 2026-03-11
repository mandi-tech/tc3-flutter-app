import 'package:flutter/material.dart';

import '../../../components/app_button.dart';
import '../../../components/app_password_field.dart';
import '../../../tokens/app_spacing.dart';

class ChangePasswordFormStory extends StatelessWidget {
  const ChangePasswordFormStory({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppPasswordField(
          label: 'Nova senha',
          hintText: 'Digite sua nova senha',
        ),
        SizedBox(height: AppSpacing.md),
        AppPasswordField(
          label: 'Confirmar nova senha',
          hintText: 'Digite novamente a nova senha',
        ),
        SizedBox(height: AppSpacing.lg),
        AppButton(
          label: 'Salvar nova senha',
          onPressed: null,
        ),
      ],
    );
  }
}