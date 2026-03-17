import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../../../../utils/theme_extensions.dart';
import '../../../../components/app_button.dart';
import '../../../../components/app_email_field.dart';
import '../../../../components/app_password_field.dart';
import '../../../../components/app_text_field.dart';
import '../../../../tokens/app_spacing.dart';
import '../../widgets/story_preview_frame.dart';
import '../../../previews/features/auth/widgets/auth_header_preview.dart';

final List<Story> registerScreenStories = [
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
    name: 'Screens/Responsive/Register Screen Responsive',
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

class _RegisterScreenPreview extends StatelessWidget {
  const _RegisterScreenPreview();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AuthHeaderPreview(
          title: 'Crie sua conta',
          description: 'Comece a organizar sua vida financeira em poucos passos',
        ),
        SizedBox(height: AppSpacing.xl),
        _RegisterFormOnly(),
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
          prefixIcon: Icon(
            Icons.person_outline_rounded,
            color: context.colors.secondary,
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