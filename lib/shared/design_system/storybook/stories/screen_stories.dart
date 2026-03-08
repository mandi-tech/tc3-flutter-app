import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../components/app_button.dart';
import '../../components/app_email_field.dart';
import '../../components/app_password_field.dart';
import '../../components/app_text_field.dart';
import '../../tokens/app_colors.dart';
import '../../tokens/app_spacing.dart';
import '../../tokens/app_typography.dart';
import '../widgets/story_preview_frame.dart';

final List<Story> screenStories = [
  Story(
    name: 'Screens/Login Screen',
    description: 'Tela completa de login.',
    builder: (_) => const StoryPreviewFrame(
      width: 380,
      title: 'Login Screen',
      child: _LoginScreenPreview(),
    ),
  ),
  Story(
    name: 'Screens/Login Screen Responsive',
    description: 'Tela completa de login em larguras diferentes.',
    builder: (_) => SingleChildScrollView(
      child: Column(
        children: const [
          StoryPreviewFrame(
            width: 320,
            title: 'Mobile Small',
            child: _LoginScreenPreview(),
          ),
          SizedBox(height: AppSpacing.xl),
          StoryPreviewFrame(
            width: 390,
            title: 'Mobile Large',
            child: _LoginScreenPreview(),
          ),
          SizedBox(height: AppSpacing.xl),
          StoryPreviewFrame(
            width: 600,
            title: 'Tablet',
            child: _LoginScreenPreview(),
          ),
        ],
      ),
    ),
  ),
  Story(
    name: 'Screens/Register Screen',
    description: 'Tela completa de cadastro.',
    builder: (_) => const StoryPreviewFrame(
      width: 380,
      title: 'Register Screen',
      child: _RegisterScreenPreview(),
    ),
  ),
  Story(
    name: 'Screens/Register Screen Responsive',
    description: 'Tela completa de cadastro em larguras diferentes.',
    builder: (_) => SingleChildScrollView(
      child: Column(
        children: const [
          StoryPreviewFrame(
            width: 320,
            title: 'Mobile Small',
            child: _RegisterScreenPreview(),
          ),
          SizedBox(height: AppSpacing.xl),
          StoryPreviewFrame(
            width: 390,
            title: 'Mobile Large',
            child: _RegisterScreenPreview(),
          ),
          SizedBox(height: AppSpacing.xl),
          StoryPreviewFrame(
            width: 600,
            title: 'Tablet',
            child: _RegisterScreenPreview(),
          ),
        ],
      ),
    ),
  ),
];

class _LoginScreenPreview extends StatelessWidget {
  const _LoginScreenPreview();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        _AuthHeaderPreview(
          title: 'Bem-vinda!',
          description: 'Entre com seu e-mail e senha para continuar',
        ),
        SizedBox(height: AppSpacing.xl),
        _LoginFormOnly(),
      ],
    );
  }
}

class _RegisterScreenPreview extends StatelessWidget {
  const _RegisterScreenPreview();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        _AuthHeaderPreview(
          title: 'Crie sua conta',
          description: 'Comece a organizar sua vida financeira em poucos passos',
        ),
        SizedBox(height: AppSpacing.xl),
        _RegisterFormOnly(),
      ],
    );
  }
}

class _AuthHeaderPreview extends StatelessWidget {
  final String title;
  final String description;

  const _AuthHeaderPreview({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.xl,
        horizontal: AppSpacing.lg,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withOpacity(0.18),
            AppColors.primary.withOpacity(0.08),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: AppTypography.title.copyWith(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            description,
            style: AppTypography.body.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _LoginFormOnly extends StatelessWidget {
  const _LoginFormOnly();

  @override
  Widget build(BuildContext context) {
    return Column(
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

class _RegisterFormOnly extends StatelessWidget {
  const _RegisterFormOnly();

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}