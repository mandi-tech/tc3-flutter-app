import 'package:flutter/material.dart';

import '../../../../shared/design_system/tokens/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Text('Perfil'),
      ),
    );
  }
}