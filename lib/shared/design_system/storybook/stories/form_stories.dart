import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../components/app_button.dart';
import '../../components/app_email_field.dart';
import '../../components/app_password_field.dart';
import '../../components/app_text_field.dart';
import '../../tokens/app_colors.dart';
import '../../tokens/app_spacing.dart';
import '../widgets/story_preview_frame.dart';

final List<Story> formStories = [
  Story(
    name: 'Forms/Login Form',
    description: 'Formulário de login isolado.',
    builder: (_) => const StoryPreviewFrame(
      width: 380,
      title: 'Login Form',
      child: _LoginFormPreview(),
    ),
  ),
  Story(
    name: 'Forms/Register Form',
    description: 'Formulário de cadastro isolado.',
    builder: (_) => const StoryPreviewFrame(
      width: 380,
      title: 'Register Form',
      child: _RegisterFormPreview(),
    ),
  ),
  Story(
    name: 'Forms/Change Password Form',
    description: 'Formulário de alteração de senha.',
    builder: (_) => const StoryPreviewFrame(
      width: 380,
      title: 'Change Password Form',
      child: _ChangePasswordFormPreview(),
    ),
  ),
];

class _LoginFormPreview extends StatelessWidget {
  const _LoginFormPreview();

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

class _RegisterFormPreview extends StatelessWidget {
  const _RegisterFormPreview();

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

class _ChangePasswordFormPreview extends StatelessWidget {
  const _ChangePasswordFormPreview();

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