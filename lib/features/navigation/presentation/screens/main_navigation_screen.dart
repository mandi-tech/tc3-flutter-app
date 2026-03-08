import 'package:flutter/material.dart';

import '../../../../shared/design_system/tokens/app_colors.dart';
import '../../../add_transaction/presentation/screens/add_transaction_screen.dart';
import '../../../cards/presentation/screens/cards_screen.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../../../profile/presentation/screens/profile_screen.dart';
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

  final List<Widget> _pages = const [
    HomeScreen(),
    TransactionsScreen(),
    AddTransactionScreen(),
    ChartsScreen(),
    ProfileScreen(),
  ];

  void _onTabSelected(NavigationTab tab) {
    setState(() {
      _currentTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = NavigationTab.values.indexOf(_currentTab);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: IndexedStack(
        index: currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: MainNavigationBar(
        currentTab: _currentTab,
        onTabSelected: _onTabSelected,
      ),
    );
  }
}