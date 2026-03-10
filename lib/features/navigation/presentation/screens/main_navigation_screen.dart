import 'package:flutter/material.dart';

import '../../../../shared/utils/theme_extensions.dart';
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
  int _addScreenVersion = 0;

  final List<Widget> _persistentPages = const [
    HomeScreen(),
    TransactionsScreen(),
    ChartsScreen(),
    ProfileScreen(),
  ];

  void _onTabSelected(NavigationTab tab) {
    if (tab == NavigationTab.addTransaction) {
      setState(() {
        _currentTab = NavigationTab.addTransaction;
        _addScreenVersion++;
      });
      return;
    }

    setState(() {
      _currentTab = tab;
    });
  }

  int get _persistentIndex {
    switch (_currentTab) {
      case NavigationTab.home:
        return 0;
      case NavigationTab.transactions:
        return 1;
      case NavigationTab.cards:
        return 2;
      case NavigationTab.profile:
        return 3;
      case NavigationTab.addTransaction:
        return 0;
    }
  }

  Widget _buildBody() {
    if (_currentTab == NavigationTab.addTransaction) {
      return AddTransactionScreen(
        key: ValueKey(_addScreenVersion),
      );
    }

    return IndexedStack(
      index: _persistentIndex,
      children: _persistentPages,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: _buildBody(),
      bottomNavigationBar: MainNavigationBar(
        currentTab: _currentTab,
        onTabSelected: _onTabSelected,
      ),
    );
  }
}