import 'package:flutter/material.dart';

import '../../../components/app_button.dart';
import '../../../components/app_email_field.dart';
import '../../../components/app_password_field.dart';
import '../../../tokens/app_spacing.dart';

class LoginFormStory extends StatelessWidget {
  const LoginFormStory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        AppEmailField(),
        SizedBox(height: AppSpacing.md),
        AppPasswordField(),
        SizedBox(height: AppSpacing.lg),
        AppButton(
          label: 'Entrar',
          onPressed: null,
        ),
      ],
    );
  }
}