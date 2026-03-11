import 'package:flutter/material.dart';

import '../../../../shared/utils/theme_extensions.dart';

class AddTransactionScreen extends StatelessWidget {
  const AddTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: Center(
        child: Text('Adicionar transação'),
      ),
    );
  }
}