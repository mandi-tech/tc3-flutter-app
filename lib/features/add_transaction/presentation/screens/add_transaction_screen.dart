import 'package:flutter/material.dart';

import '../widgets/add_transaction_view.dart';

class AddTransactionScreen extends StatelessWidget {
  const AddTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova transação'),
        centerTitle: true,
      ),
      body: AddTransactionView(),
    );
  }
}