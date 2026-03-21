import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../../../tokens/app_spacing.dart';
import '../../widgets/story_preview_frame.dart';
import '../../../previews/features/profile/profile_screen_preview.dart';

final List<Story> profileScreenStories = [
  Story(
    name: 'Screens/Profile',
    description: 'Tela principal de perfil e configurações.',
    builder: (context) => const StoryPreviewFrame(
      width: 390,
      title: 'Profile Screen',
      child: ProfileScreenPreview(),
    ),
  ),

  Story(
    name: 'Screens/Responsive/Profile Responsive',
    builder: (context) => SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          children: const [
            StoryPreviewFrame(
              key: Key('profile_small'),
              width: 320,
              title: 'Mobile Small',
              child: ProfileScreenPreview(),
            ),
            SizedBox(height: AppSpacing.xl),
            StoryPreviewFrame(
              key: Key('profile_large'),
              width: 390,
              title: 'Mobile Large',
              child: ProfileScreenPreview(),
            ),
            SizedBox(height: AppSpacing.xl),
            StoryPreviewFrame(
              key: Key('profile_tablet'),
              width: 600,
              height: 500,
              title: 'Tablet',
              child: ProfileScreenPreview(),
            ),
          ],
        ),
      ),
    ),
  ),
];