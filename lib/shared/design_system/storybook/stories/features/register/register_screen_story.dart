import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import '../../../../tokens/app_spacing.dart';
import '../../widgets/story_preview_frame.dart';
import '../../../previews/features/register/register_screen_preview.dart';

final List<Story> registerScreenStories = [
  Story(
    name: 'Screens/Register',
    description: 'Tela para cadastro de novos usuários.',
    builder: (context) => const StoryPreviewFrame(
      width: 380,
      title: 'Register Screen',
      child: RegisterScreenPreview(),
    ),
  ),
  Story(
    name: 'Screens/Responsive/Register Responsive',
    builder: (_) => SingleChildScrollView(
      child: Column(
        children: const [
          StoryPreviewFrame(width: 320, title: 'Mobile Small', child: RegisterScreenPreview()),
          SizedBox(height: AppSpacing.xl),
          StoryPreviewFrame(width: 390, title: 'Mobile Large', child: RegisterScreenPreview()),
          SizedBox(height: AppSpacing.xl),
          StoryPreviewFrame(width: 600, title: 'Tablet', child: RegisterScreenPreview()),
        ],
      ),
    ),
  ),
];