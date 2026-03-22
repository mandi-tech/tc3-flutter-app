import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../../../../../../features/navigation/domain/navigation_tab.dart';
import '../../../../../../../features/navigation/presentation/widgets/main_navigation_bar.dart';
import '../../../../../tokens/app_spacing.dart';

final Story mainNavigationBarStatesStory = Story(
  name: 'States/Navigation/MainNavigationBar',
  description: 'Estados visuais da navbar com cada aba selecionada.',
  builder: (context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (final tab in NavigationTab.values) ...[
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: MainNavigationBar(
                currentTab: tab,
                onTabSelected: (_) {},
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
          ],
        ],
      ),
    );
  }
);
