import 'package:flutter/material.dart';

import '../../../../shared/design_system/components/app_tob_bar.dart';
import '../../domain/enums/transaction_type.dart';
import '../views/add_transaction_view.dart';

class AddTransactionScreen extends StatelessWidget {
  final TransactionType initialType;

  const AddTransactionScreen({
    super.key,
    required this.initialType,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(
        title: 'Nova transação',
        showBackButton: true,
      ),
      body: AddTransactionView(
        initialType: initialType,
      ),
    );
  }
}