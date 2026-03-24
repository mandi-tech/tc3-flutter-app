import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../../../../../../features/transactions/presentation/widgets/transaction_empty_state.dart';

final List<Story> transactionEmptyStateStories = [
  Story(
    name: 'States/Transactions/TransactionEmptyState',
    description: 'Estado vazio da tela de transações.',
    builder: (_) {
      return const Scaffold(
        body: Center(
          child: TransactionEmptyState(),
        ),
      );
    },
  ),
];