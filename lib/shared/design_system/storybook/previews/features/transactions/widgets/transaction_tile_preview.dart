import 'package:flutter/material.dart';

import '../../../../../../../features/transactions/data/models/transaction_model.dart';
import '../../../../../../../features/transactions/presentation/widgets/transaction_tile.dart';

class TransactionTilePreview extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionTilePreview({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
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
  }
}