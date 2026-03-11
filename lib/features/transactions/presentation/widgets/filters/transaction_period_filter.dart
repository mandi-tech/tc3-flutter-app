import 'package:flutter/material.dart';

import '../../../../../shared/design_system/components/app_dropdown_field.dart';
import '../../utils/transaction_filter.dart';

class TransactionPeriodDropdown extends StatelessWidget {
  final TransactionPeriodFilter selectedPeriod;
  final ValueChanged<TransactionPeriodFilter> onChanged;

  const TransactionPeriodDropdown({
    super.key,
    required this.selectedPeriod,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AppDropdownField<TransactionPeriodFilter>(
      label: 'Período',
      value: selectedPeriod,
      items: const [
        DropdownMenuItem(
          value: TransactionPeriodFilter.all,
          child: Text('Todo o período'),
        ),
        DropdownMenuItem(
          value: TransactionPeriodFilter.today,
          child: Text('Hoje'),
        ),
        DropdownMenuItem(
          value: TransactionPeriodFilter.last7Days,
          child: Text('Últimos 7 dias'),
        ),
        DropdownMenuItem(
          value: TransactionPeriodFilter.last30Days,
          child: Text('Últimos 30 dias'),
        ),
        DropdownMenuItem(
          value: TransactionPeriodFilter.currentMonth,
          child: Text('Mês atual'),
        ),
      ],
      onChanged: (value) {
        if (value != null) {
          onChanged(value);
        }
      },
    );
  }
}