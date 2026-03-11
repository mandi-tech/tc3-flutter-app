import 'package:flutter/material.dart';

import '../../data/models/transaction_model.dart';
import 'transaction_tile.dart';

class TransactionsList extends StatelessWidget {
  final List<TransactionModel> transactions;
  final Future<void> Function(String id)? onDelete;

  const TransactionsList({
    super.key,
    required this.transactions,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      itemCount: transactions.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final transaction = transactions[index];

        return TransactionTile(
          transaction: transaction,
          onDelete: onDelete == null
              ? null
              : () async => onDelete!(transaction.id),
        );
      },
    );
  }
}