import 'package:flutter/material.dart';

import '../../../../shared/design_system/tokens/app_colors.dart';
import '../../../../shared/design_system/tokens/app_spacing.dart';
import '../../domain/navigation_tab.dart';

class MainNavigationBar extends StatelessWidget {
  final NavigationTab currentTab;
  final ValueChanged<NavigationTab> onTabSelected;

  const MainNavigationBar({
    super.key,
    required this.currentTab,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {

    final tabs = NavigationTab.values;

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          0,
          AppSpacing.md,
          AppSpacing.md,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: AppColors.secondary.withOpacity(0.10),
                blurRadius: 24,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: NavigationBar(
            selectedIndex: tabs.indexOf(currentTab),

            onDestinationSelected: (index) {
              onTabSelected(tabs[index]);
            },

            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            indicatorColor: AppColors.primary.withOpacity(0.16),

            destinations: tabs.map((tab) {
              final isAdd = tab == NavigationTab.add;

              return NavigationDestination(
                icon: isAdd
                    ? _buildAddButton()
                    : Icon(tab.icon),

                selectedIcon: isAdd
                    ? _buildAddButton(selected: true)
                    : Icon(tab.selectedIcon),

                label: tab.label,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildAddButton({bool selected = false}) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: selected ? AppColors.secondary : AppColors.primary,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}