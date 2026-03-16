import 'package:flutter/material.dart';

import '../../../../shared/widgets/app_tob_bar.dart';
import '../widgets/add_transaction_view.dart';

class AddTransactionScreen extends StatelessWidget {
  const AddTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(
        title: "Adicionar nova transação",
      ),
      body: AddTransactionView(),
    );
  }
}