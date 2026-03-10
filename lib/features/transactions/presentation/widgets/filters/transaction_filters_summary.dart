import 'package:flutter/material.dart';

import '../../utils/transaction_filter.dart';

class TransactionFiltersSummary extends StatelessWidget {
  final TransactionTypeFilter selectedType;
  final TransactionPeriodFilter selectedPeriod;
  final String? selectedCategory;
  final String searchQuery;

  const TransactionFiltersSummary({
    super.key,
    required this.selectedType,
    required this.selectedPeriod,
    required this.selectedCategory,
    required this.searchQuery,
  });

  String _typeLabel(TransactionTypeFilter type) {
    switch (type) {
      case TransactionTypeFilter.all:
        return 'Todos';
      case TransactionTypeFilter.income:
        return 'Entradas';
      case TransactionTypeFilter.expense:
        return 'Saídas';
    }
  }

  String _periodLabel(TransactionPeriodFilter period) {
    switch (period) {
      case TransactionPeriodFilter.all:
        return 'Todo o período';
      case TransactionPeriodFilter.today:
        return 'Hoje';
      case TransactionPeriodFilter.last7Days:
        return '7 dias';
      case TransactionPeriodFilter.last30Days:
        return '30 dias';
      case TransactionPeriodFilter.currentMonth:
        return 'Mês atual';
    }
  }

  String _buildSummary() {
    final parts = <String>[
      _typeLabel(selectedType),
      _periodLabel(selectedPeriod),
    ];

    if (selectedCategory != null) {
      parts.add(selectedCategory!);
    }

    if (searchQuery.trim().isNotEmpty) {
      parts.add('Busca: ${searchQuery.trim()}');
    }

    return parts.join(' • ');
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _buildSummary(),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}