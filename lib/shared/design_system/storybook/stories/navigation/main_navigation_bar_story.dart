import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../../../../features/navigation/domain/navigation_tab.dart';
import '../../../../../features/navigation/presentation/widgets/main_navigation_bar.dart';

final List<Story> mainNavigationBarStories = [
  Story(
    name: 'Navigation/MainNavigationBar',
    description: 'Barra principal de navegação do app.',
    builder: (context) {
      final selectedTab = context.knobs.options<NavigationTab>(
        label: 'Selected tab',
        initial: NavigationTab.home,
        options: const [
          Option(label: 'Home', value: NavigationTab.home),
          Option(label: 'Extrato', value: NavigationTab.transactions),
          Option(label: 'Cartões', value: NavigationTab.cards),
          Option(label: 'Perfil', value: NavigationTab.profile),
        ],
      );

      return Align(
        alignment: Alignment.bottomCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: MainNavigationBar(
            currentTab: selectedTab,
            onTabSelected: (_) {},
          ),
        ),
      );
    },
  ),
];