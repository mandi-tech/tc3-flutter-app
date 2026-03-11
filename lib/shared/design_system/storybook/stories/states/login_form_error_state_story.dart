import 'package:flutter/material.dart';

import '../../../../utils/theme_extensions.dart';
import '../../../components/app_button.dart';
import '../../../components/app_email_field.dart';
import '../../../components/app_password_field.dart';
import '../../../tokens/app_spacing.dart';
import '../../../tokens/app_typography.dart';
import 'widgets/state_story_card.dart';
import 'widgets/state_story_center.dart';

class LoginFormErrorStateStory extends StatelessWidget {
  const LoginFormErrorStateStory({super.key});

  @override
  Widget build(BuildContext context) {
    return StateStoryCenter(
      maxWidth: 380,
      child: StateStoryCard(
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppEmailField(
                controller: TextEditingController(text: 'email-invalido'),
                validator: (_) => 'Informe um e-mail válido.',
              ),
              const SizedBox(height: AppSpacing.md),
              AppPasswordField(
                controller: TextEditingController(text: '123'),
                validator: (_) => 'Senha incorreta.',
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'E-mail ou senha incorretos.',
                style: AppTypography.caption.copyWith(
                  color: context.colors.error,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              const AppButton(
                label: 'Entrar',
                onPressed: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}