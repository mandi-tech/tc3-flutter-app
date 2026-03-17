import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../../../components/app_button.dart';
import '../../../../components/app_email_field.dart';
import '../../../../components/app_password_field.dart';
import '../../../../tokens/app_spacing.dart';
import '../../widgets/story_preview_frame.dart';
import '../../../previews/features/auth/widgets/auth_header_preview.dart';

final List<Story> loginScreenStories = [
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
];

class _LoginScreenPreview extends StatelessWidget {
  const _LoginScreenPreview();

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AuthHeaderPreview(
          title: 'Bem-vinda!',
          description: 'Entre com seu e-mail e senha para continuar',
        ),
        SizedBox(height: AppSpacing.xl),
        _LoginFormOnly(),
      ],
    );
  }
}

class _LoginFormOnly extends StatelessWidget {
  const _LoginFormOnly();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
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