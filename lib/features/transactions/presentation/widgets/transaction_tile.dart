import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/models/transaction_model.dart';

class TransactionTile extends StatelessWidget {
  final TransactionModel transaction;
  final Future<void> Function()? onDelete;

  const TransactionTile({
    super.key,
    required this.transaction,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final isIncome = transaction.type == 'income';
    final currency = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
    );
    final dateFormatted = DateFormat('dd/MM/yyyy').format(transaction.date);

    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        leading: CircleAvatar(
          child: Icon(
            isIncome ? Icons.arrow_downward : Icons.arrow_upward,
          ),
        ),
        title: Text(
          transaction.description,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          '${transaction.category} • $dateFormatted',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${isIncome ? '+' : '-'} ${currency.format(transaction.amount)}',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            if (onDelete != null) ...[
              const SizedBox(width: 8),
              IconButton(
                onPressed: onDelete,
                icon: const Icon(Icons.delete_outline),
                tooltip: 'Excluir',
              ),
            ],
          ],
        ),
      ),
    );
  }
}