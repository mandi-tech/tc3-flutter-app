import 'package:flutter/material.dart';

enum NavigationTab {
  home,
  transactions,
  profile,
}

extension NavigationTabExtension on NavigationTab {
  String get label {
    switch (this) {
      case NavigationTab.home:
        return 'Home';
      case NavigationTab.transactions:
        return 'Extrato';
      case NavigationTab.profile:
        return 'Perfil';
    }
  }

  IconData get icon {
    switch (this) {
      case NavigationTab.home:
        return Icons.home_outlined;
      case NavigationTab.transactions:
        return Icons.receipt_outlined;
      case NavigationTab.profile:
        return Icons.person_outlined;
    }
  }

  IconData get selectedIcon {
    switch (this) {
      case NavigationTab.home:
        return Icons.home_rounded;
      case NavigationTab.transactions:
        return Icons.receipt_rounded;
      case NavigationTab.profile:
        return Icons.person;
    }
  }
}