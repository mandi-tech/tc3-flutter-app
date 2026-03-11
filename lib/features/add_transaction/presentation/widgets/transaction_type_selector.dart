import 'package:flutter/material.dart';

import '../../../../shared/design_system/components/app_button.dart';
import '../../../transactions/presentation/enums/transaction_type.dart';

class TransactionTypeSelector extends StatelessWidget {
  final TransactionType selectedType;
  final ValueChanged<TransactionType> onChanged;

  const TransactionTypeSelector({
    super.key,
    required this.selectedType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isExpense = selectedType == TransactionType.expense;
    final isIncome = selectedType == TransactionType.income;

    return Row(
      children: [
        Expanded(
          child: AppButton(
            key: const ValueKey('transaction-type-expense'),
            label: 'Saída',
            onPressed: () => onChanged(TransactionType.expense),
            variant: isExpense
                ? AppButtonVariant.primary
                : AppButtonVariant.secondary,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: AppButton(
            key: const ValueKey('transaction-type-income'),
            label: 'Entrada',
            onPressed: () => onChanged(TransactionType.income),
            variant: isIncome
                ? AppButtonVariant.primary
                : AppButtonVariant.secondary,
          ),
        ),
      ],
    );
  }
}