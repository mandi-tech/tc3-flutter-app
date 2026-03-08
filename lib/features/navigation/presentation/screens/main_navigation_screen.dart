import 'package:flutter/material.dart';

import '../../../add_transaction/presentation/screens/add_transaction_screen.dart';
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

  late final Map<NavigationTab, Widget> _pages = {
    NavigationTab.home: const HomeScreen(),
    NavigationTab.transactions: const TransactionsScreen(),
    NavigationTab.add: const AddTransactionScreen(),
    NavigationTab.profile: const ProfileScreen(),
  };

  void _onTabSelected(NavigationTab tab) {
    setState(() {
      _currentTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: NavigationTab.values.indexOf(_currentTab),
        children: _pages.values.toList(),
      ),
      bottomNavigationBar: MainNavigationBar(
        currentTab: _currentTab,
        onTabSelected: _onTabSelected,
      ),
    );
  }
}