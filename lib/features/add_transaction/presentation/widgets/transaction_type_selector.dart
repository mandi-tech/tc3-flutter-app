import 'package:flutter/material.dart';

import '../../../../shared/design_system/components/app_button.dart';

class TransactionTypeSelector extends StatelessWidget {
  final String selectedType;
  final ValueChanged<String> onChanged;

  const TransactionTypeSelector({
    super.key,
    required this.selectedType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isExpense = selectedType == 'expense';
    final isIncome = selectedType == 'income';

    return Row(
      children: [
        Expanded(
          child: AppButton(
            key: const ValueKey('transaction-type-expense'),
            label: 'Saída',
            onPressed: () => onChanged('expense'),
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
            onPressed: () => onChanged('income'),
            variant: isIncome
                ? AppButtonVariant.primary
                : AppButtonVariant.secondary,
          ),
        ),
      ],
    );
  }
}