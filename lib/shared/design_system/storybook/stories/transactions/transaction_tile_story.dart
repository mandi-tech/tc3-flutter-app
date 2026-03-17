import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../../../../features/transactions/data/models/transaction_model.dart';
import '../../../../../features/transactions/domain/enums/transaction_type.dart';
import '../../../../../features/transactions/presentation/widgets/transaction_tile.dart';

final List<Story> transactionTileStories = [
  Story(
    name: 'Transactions/TransactionTile',
    description: 'Item de transação com entrada e saída.',
    builder: (context) {
      final type = context.knobs.options<String>(
        label: 'Type',
        initial: 'expense',
        options: const [
          Option(label: 'Entrada', value: 'income'),
          Option(label: 'Saída', value: 'expense'),
        ],
      );

      final description = context.knobs.text(
        label: 'Description',
        initial: 'Mercado',
      );

      final category = context.knobs.text(
        label: 'Category',
        initial: 'Alimentação',
      );

      final amount = context.knobs.slider(
        label: 'Amount',
        min: 0,
        max: 5000,
        initial: 120.90,
      );

      final transaction = TransactionModel(
        id: '1',
        type: type == 'income' ? TransactionType.income : TransactionType.expense,
        description: description,
        category: category,
        amount: amount,
        date: DateTime(2026, 3, 10),
        receiptImageUrl: null,
      );

      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: TransactionTile(
              transaction: transaction,
            ),
          ),
        ),
      );
    },
  ),
];