import 'package:flutter/material.dart';

import '../../../../../features/navigation/domain/navigation_tab.dart';
import '../../../../../features/navigation/presentation/widgets/main_navigation_bar.dart';
import '../../../tokens/app_spacing.dart';

class MainNavigationBarStatesStory extends StatelessWidget {
  const MainNavigationBarStatesStory({super.key});

  @override
  Widget build(BuildContext context) {
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
}