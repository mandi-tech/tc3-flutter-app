import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../../../../../features/transactions/domain/enums/transaction_type.dart';
import '../../../../../../features/transactions/data/models/transaction_model.dart';
import '../../../../../../features/transactions/presentation/utils/transaction_grouping.dart';
import '../../../../../../features/transactions/presentation/widgets/transaction_group_section.dart';

final List<Story> transactionGroupSectionStories = [
  Story(
    name: 'Transactions/TransactionGroupSection',
    description: 'Grupo de transações por data.',
    builder: (_) {
      final group = TransactionGroup(
        title: 'Hoje',
        transactions: [
          TransactionModel(
            id: '1',
            type: TransactionType.expense,
            description: 'Mercado',
            category: 'Alimentação',
            amount: 120.90,
            date: DateTime.now(),
            receiptImageUrl: null,
          ),
          TransactionModel(
            id: '2',
            type: TransactionType.expense,
            description: 'Uber',
            category: 'Transporte',
            amount: 24.50,
            date: DateTime.now(),
            receiptImageUrl: null,
          ),
          TransactionModel(
            id: '3',
            type: TransactionType.income,
            description: 'Freelance',
            category: 'Freelance',
            amount: 800,
            date: DateTime.now(),
            receiptImageUrl: null,
          ),
        ],
      );

      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: TransactionGroupSection(
            group: group,
          ),
        ),
      );
    },
  ),
];