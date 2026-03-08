import 'package:flutter/material.dart';

enum NavigationTab {
  home,
  transactions,
  add,
  profile,
}

extension NavigationTabExtension on NavigationTab {

  String get label {
    switch (this) {
      case NavigationTab.home:
        return 'Home';
      case NavigationTab.transactions:
        return 'Extrato';
      case NavigationTab.add:
        return 'Adicionar';
      case NavigationTab.profile:
        return 'Perfil';
    }
  }

  IconData get icon {
    switch (this) {
      case NavigationTab.home:
        return Icons.home_outlined;

      case NavigationTab.transactions:
        return Icons.receipt_long_outlined;

      case NavigationTab.add:
        return Icons.add;

      case NavigationTab.profile:
        return Icons.person_outline;
    }
  }

  IconData get selectedIcon {
    switch (this) {
      case NavigationTab.home:
        return Icons.home_rounded;

      case NavigationTab.transactions:
        return Icons.receipt_long_rounded;

      case NavigationTab.add:
        return Icons.add;

      case NavigationTab.profile:
        return Icons.person;
    }
  }
}