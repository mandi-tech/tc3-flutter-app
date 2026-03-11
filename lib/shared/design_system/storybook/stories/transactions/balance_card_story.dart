import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../../../../features/transactions/presentation/widgets/balance_card.dart';

final List<Story> balanceCardStories = [
  Story(
    name: 'Transactions/BalanceCard',
    description: 'Card de saldo total.',
    builder: (context) {
      final balance = context.knobs.slider(
        label: 'Balance',
        min: -5000,
        max: 10000,
        initial: 2450.75,
      );

      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: BalanceCard(balance: balance),
          ),
        ),
      );
    },
  ),
];