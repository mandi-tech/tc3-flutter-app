import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../shared/design_system/tokens/app_colors.dart';
import '../../data/models/transaction_model.dart';
import '../../domain/enums/transaction_type.dart';
import '../mappers/category_icon_mapper.dart';

class TransactionTile extends StatelessWidget {
  final TransactionModel transaction;
  final Future<void> Function()? onDelete;
  final VoidCallback? onTap;

  const TransactionTile({
    super.key,
    required this.transaction,
    this.onDelete,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    final isIncome = transaction.type.isIncome;

    final color = isIncome ? AppColors.income : AppColors.expense;

    final currency = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
    );

    final dateFormatted = DateFormat('dd/MM/yyyy').format(transaction.date);

    return Card(
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.15),
          child: Icon(
            CategoryIconMapper.getIcon(transaction.category),
            color: color,
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
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: color,
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