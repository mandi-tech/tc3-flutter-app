import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../../../../features/navigation/domain/navigation_tab.dart';
import '../../../../../features/navigation/presentation/widgets/main_navigation_bar.dart';
import '../../../../utils/theme_extensions.dart';
import '../../../tokens/app_spacing.dart';
import '../../../tokens/app_typography.dart';
import '../../widgets/story_preview_frame.dart';

final List<Story> mainNavigationScreenStories = [
  Story(
    name: 'Screens/Main Navigation Screen',
    description: 'Prévia da tela principal com conteúdo e navbar.',
    builder: (context) {
      final selectedTab = context.knobs.options<NavigationTab>(
        label: 'Selected tab',
        initial: NavigationTab.home,
        options: const [
          Option(label: 'Home', value: NavigationTab.home),
          Option(label: 'Extrato', value: NavigationTab.transactions),
          Option(label: 'Adicionar', value: NavigationTab.addTransaction),
          Option(label: 'Cartões', value: NavigationTab.cards),
          Option(label: 'Perfil', value: NavigationTab.profile),
        ],
      );

      return StoryPreviewFrame(
        width: 390,
        title: 'Main Navigation',
        child: _MainNavigationScreenPreview(
          selectedTab: selectedTab,
        ),
      );
    },
  ),
];

class _MainNavigationScreenPreview extends StatelessWidget {
  final NavigationTab selectedTab;

  const _MainNavigationScreenPreview({
    required this.selectedTab,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 640,
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: context.theme.scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: context.colors.outlineVariant,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                _titleForTab(selectedTab),
                style: AppTypography.title.copyWith(
                  color: context.colors.onSurface,
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          MainNavigationBar(
            currentTab: selectedTab,
            onTabSelected: (_) {},
          ),
        ],
      ),
    );
  }

  String _titleForTab(NavigationTab tab) {
    switch (tab) {
      case NavigationTab.home:
        return 'Home';
      case NavigationTab.transactions:
        return 'Extrato';
      case NavigationTab.addTransaction:
        return 'Adicionar transação';
      case NavigationTab.cards:
        return 'Cartões';
      case NavigationTab.profile:
        return 'Perfil';
    }
  }
}