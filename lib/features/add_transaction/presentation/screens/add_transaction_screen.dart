import 'package:flutter/material.dart';
import 'package:tc3_flutter_app/shared/design_system/tokens/app_colors.dart';

class AddTransactionScreen extends StatelessWidget {
  const AddTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Text('Adicionar transação'),
      ),
    );
  }
}