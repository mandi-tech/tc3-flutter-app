import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import '../../../../../../features/navigation/domain/navigation_tab.dart';
import '../../../../tokens/app_spacing.dart';
import '../../widgets/story_preview_frame.dart';
import '../../../previews/features/navigation/main_navigation_preview.dart';

final List<Story> mainNavigationStories = [
  Story(
    name: 'Screens/Main Navigation',
    description: 'Prévia da estrutura principal com a Navbar.',
    builder: (context) {
      final selectedTab = context.knobs.options<NavigationTab>(
        label: 'Aba Selecionada',
        initial: NavigationTab.home,
        options: const [
          Option(label: 'Home', value: NavigationTab.home),
          Option(label: 'Extrato', value: NavigationTab.transactions),
          Option(label: 'Perfil', value: NavigationTab.profile),
        ],
      );

      return StoryPreviewFrame(
        width: 390,
        title: 'Main Navigation',
        child: MainNavigationPreview(selectedTab: selectedTab),
      );
    },
  ),

  Story(
    name: 'Screens/Responsive/Navigation Responsive',
    builder: (context) => SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          children: const [
            StoryPreviewFrame(
              key: Key('nav_small'),
              width: 320,
              title: 'Mobile Small',
              child: MainNavigationPreview(),
            ),
            SizedBox(height: AppSpacing.xl),
            StoryPreviewFrame(
              key: Key('nav_large'),
              width: 390,
              title: 'Mobile Large',
              child: MainNavigationPreview(),
            ),
            SizedBox(height: AppSpacing.xl),
            StoryPreviewFrame(
              key: Key('nav_tablet'),
              width: 600,
              height: 500,
              title: 'Tablet',
              child: MainNavigationPreview(),
            ),
          ],
        ),
      ),
    ),
  ),
];