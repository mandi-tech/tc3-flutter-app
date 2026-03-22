import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../../../tokens/app_spacing.dart';
import '../../../previews/features/profile/account_screen_preview.dart';
import '../../widgets/story_preview_frame.dart';

final List<Story> accountScreenStories = [
  Story(
    name: 'Screens/Account',
    description: 'Tela de exibição dos dados cadastrais do usuário.',
    builder: (context) => const StoryPreviewFrame(
      width: 390,
      title: 'Account Screen',
      child: AccountScreenPreview(),
    ),
  ),

  Story(
    name: 'Screens/Responsive/Account Responsive',
    builder: (context) => SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          children: const [
            StoryPreviewFrame(
              key: Key('account_small'),
              width: 320,
              title: 'Mobile Small',
              child: AccountScreenPreview(),
            ),
            SizedBox(height: AppSpacing.xl),
            StoryPreviewFrame(
              key: Key('account_large'),
              width: 390,
              title: 'Mobile Large',
              child: AccountScreenPreview(),
            ),
            SizedBox(height: AppSpacing.xl),
            StoryPreviewFrame(
              key: Key('account_tablet'),
              width: 600,
              height: 450,
              title: 'Tablet',
              child: AccountScreenPreview(),
            ),
          ],
        ),
      ),
    ),
  ),
];