import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/transaction_controller.dart';
import '../widgets/balance_card.dart';
import '../widgets/transaction_empty_state.dart';
import '../widgets/transactions_list.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<TransactionController>().startListening();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<TransactionController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transações'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            BalanceCard(balance: controller.balance),
            Expanded(
              child: Builder(
                builder: (_) {
                  if (controller.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (controller.errorMessage != null) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          controller.errorMessage!,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }

                  if (controller.transactions.isEmpty) {
                    return const TransactionEmptyState();
                  }

                  return TransactionsList(
                    transactions: controller.transactions,
                    onDelete: (id) async {
                      await controller.deleteTransaction(id);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}