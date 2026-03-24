import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import '../../../../tokens/app_spacing.dart';
import '../../widgets/story_preview_frame.dart';
import '../../../previews/features/auth/login_screen_preview.dart';

final List<Story> loginScreenStories = [
  Story(
    name: 'Screens/Login',
    description: 'Tela para autenticação do usuário.',
    builder: (context) => const StoryPreviewFrame(
      width: 400,
      title: 'Login Screen',
      child: LoginScreenPreview(),
    ),
  ),
  Story(
    name: 'Screens/Responsive/Login Responsive',
    builder: (_) => SingleChildScrollView(
      child: Column(
        children: const [
          StoryPreviewFrame(width: 320, title: 'Mobile Small', child: LoginScreenPreview()),
          SizedBox(height: AppSpacing.xl),
          StoryPreviewFrame(width: 390, title: 'Mobile Large', child: LoginScreenPreview()),
          SizedBox(height: AppSpacing.xl),
          StoryPreviewFrame(width: 600, title: 'Tablet', child: LoginScreenPreview()),
        ],
      ),
    ),
  ),
];