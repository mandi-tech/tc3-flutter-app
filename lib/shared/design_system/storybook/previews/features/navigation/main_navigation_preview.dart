import 'package:flutter/material.dart';
import '../../../../../../features/navigation/domain/navigation_tab.dart';
import '../../../../../../features/navigation/presentation/widgets/main_navigation_bar.dart';
import '../../../../../utils/theme_extensions.dart';
import '../../../../tokens/app_spacing.dart';
import '../../../../tokens/app_typography.dart';

class MainNavigationPreview extends StatelessWidget {
  final NavigationTab selectedTab;

  const MainNavigationPreview({
    super.key,
    this.selectedTab = NavigationTab.home,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }

  String _titleForTab(NavigationTab tab) {
    switch (tab) {
      case NavigationTab.home:
        return 'Home';
      case NavigationTab.transactions:
        return 'Extrato';
      case NavigationTab.profile:
        return 'Perfil';
    }
  }
}