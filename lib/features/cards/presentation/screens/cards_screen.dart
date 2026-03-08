import 'package:flutter/material.dart';

import '../../../../shared/design_system/tokens/app_colors.dart';

class ChartsScreen extends StatelessWidget {
  const ChartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Text('Cartões'),
      ),
    );
  }
}