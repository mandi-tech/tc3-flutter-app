import 'package:flutter/material.dart';
import 'package:tc3_flutter_app/shared/utils/navigation_extensions.dart';

import '../../../../shared/design_system/components/app_speed_dial.dart';
import '../../../../shared/utils/theme_extensions.dart';
import '../../../../shared/design_system/components/app_tob_bar.dart';
import '../../../cards/presentation/screens/cards_screen.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../../../profile/presentation/screens/profile_screen.dart';
import '../../../transactions/presentation/enums/transaction_type.dart';
import '../../../transactions/presentation/screens/transactions_screen.dart';
import '../../domain/navigation_tab.dart';
import '../widgets/main_navigation_bar.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  NavigationTab _currentTab = NavigationTab.home;

  final Map<NavigationTab, Widget> _pages = const {
    NavigationTab.home: HomeScreen(),
    NavigationTab.transactions: TransactionsScreen(),
    NavigationTab.cards: ChartsScreen(),
    NavigationTab.profile: ProfileScreen(),
  };

  void _onTabSelected(NavigationTab tab) {
    setState(() {
      _currentTab = tab;
    });
  }

  PreferredSizeWidget _buildAppBar() {
    switch (_currentTab) {
      case NavigationTab.home:
        return const AppTopBar(title: "Dashboard");

      case NavigationTab.transactions:
        return const AppTopBar(title: "Transações");

      case NavigationTab.cards:
        return const AppTopBar(title: "Cartões");

      case NavigationTab.profile:
        return const AppTopBar(title: "Perfil");
    }
  }

  // Widget? _buildFab() {
  //   if (_currentTab == NavigationTab.profile) {
  //     return null;
  //   }

  //   return const ExpandableFab();
  // }

  @override
  Widget build(BuildContext context) {
    final pages = _pages.values.toList();
    final index = _pages.keys.toList().indexOf(_currentTab);

    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: _buildAppBar(),
      body: IndexedStack(
        index: index,
        children: pages,
      ),
      floatingActionButton: AppSpeedDial(
        onIncomeTap: () {
          context.pushPage('/add-transaction', extra: TransactionType.income);
        },
        onExpenseTap: () {
          context.pushPage('/add-transaction', extra: TransactionType.expense);
        },
      ),
      bottomNavigationBar: MainNavigationBar(
        currentTab: _currentTab,
        onTabSelected: _onTabSelected,
      ),
    );
  }
}