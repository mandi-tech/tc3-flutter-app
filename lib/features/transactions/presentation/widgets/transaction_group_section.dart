import 'package:flutter/material.dart';

import '../../../../shared/design_system/tokens/app_spacing.dart';
import '../utils/transaction_grouping.dart';
import 'transaction_details_modal.dart';
import 'transaction_tile.dart';

class TransactionGroupSection extends StatelessWidget {
  final TransactionGroup group;
  final Future<void> Function(String id)? onDelete;

  const TransactionGroupSection({
    super.key,
    required this.group,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          group.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: AppSpacing.sm),
        ...group.transactions.map(
          (transaction) => Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: TransactionTile(
              transaction: transaction,
              onDelete: onDelete == null
                  ? null
                  : () async => onDelete!(transaction.id),
              onTap: () => showTransactionDetails(context, transaction),
            ),
          ),
        ),
      ],
    );
  }
}