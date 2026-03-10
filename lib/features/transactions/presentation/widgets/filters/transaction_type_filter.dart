import 'package:flutter/material.dart';

import '../../../../../shared/design_system/tokens/app_colors.dart';
import '../../../../../shared/design_system/tokens/app_spacing.dart';
import '../../utils/transaction_filter.dart';

class TransactionTypeFilterWidget extends StatelessWidget {
  final TransactionTypeFilter selectedType;
  final ValueChanged<TransactionTypeFilter> onChanged;

  const TransactionTypeFilterWidget({
    super.key,
    required this.selectedType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _TypeChip(
            label: 'Todos',
            selected: selectedType == TransactionTypeFilter.all,
            onSelected: () => onChanged(TransactionTypeFilter.all),
          ),
          const SizedBox(width: AppSpacing.sm),
          _TypeChip(
            label: 'Entradas',
            selected: selectedType == TransactionTypeFilter.income,
            onSelected: () => onChanged(TransactionTypeFilter.income),
          ),
          const SizedBox(width: AppSpacing.sm),
          _TypeChip(
            label: 'Saídas',
            selected: selectedType == TransactionTypeFilter.expense,
            onSelected: () => onChanged(TransactionTypeFilter.expense),
          ),
        ],
      ),
    );
  }
}

class _TypeChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onSelected;

  const _TypeChip({
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(
        label,
        overflow: TextOverflow.ellipsis,
      ),
      selected: selected,
      onSelected: (_) => onSelected(),
      selectedColor: AppColors.primary.withOpacity(0.18),
      backgroundColor: Theme.of(context).colorScheme.surface,
      side: BorderSide(
        color: selected
            ? AppColors.primary
            : Theme.of(context).colorScheme.outlineVariant,
      ),
      labelStyle: TextStyle(
        fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
        color: selected
            ? AppColors.primary
            : Theme.of(context).colorScheme.onSurface,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: const VisualDensity(
        horizontal: -1,
        vertical: -1,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
    );
  }
}