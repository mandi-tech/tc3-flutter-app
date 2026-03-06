import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../components/app_button.dart';
import '../../components/app_email_field.dart';
import '../../components/app_password_field.dart';
import '../../tokens/app_spacing.dart';
import '../widgets/story_preview_frame.dart';

final List<Story> screenStories = [
  Story(
    name: 'Screens/Login Form Preview',
    description: 'Prévia visual da composição de campos e botão.',
    builder: (_) {
      return const StoryPreviewFrame(
        width: 380,
        title: 'Default',
        child: _LoginFormPreview(),
      );
    },
  ),
  Story(
    name: 'Screens/Login Form Responsive',
    description: 'Prévia responsiva em larguras diferentes.',
    builder: (_) {
      return SingleChildScrollView(
        child: Column(
          children: const [
            StoryPreviewFrame(
              width: 320,
              title: 'Mobile Small',
              child: _LoginFormPreview(),
            ),
            SizedBox(height: AppSpacing.xl),
            StoryPreviewFrame(
              width: 390,
              title: 'Mobile Large',
              child: _LoginFormPreview(),
            ),
            SizedBox(height: AppSpacing.xl),
            StoryPreviewFrame(
              width: 600,
              title: 'Tablet',
              child: _LoginFormPreview(),
            ),
          ],
        ),
      );
    },
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