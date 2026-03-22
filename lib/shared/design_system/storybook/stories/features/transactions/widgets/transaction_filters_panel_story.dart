import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../../../../../../features/transactions/presentation/filters/transaction_filter.dart';
import '../../../../../../../features/transactions/presentation/widgets/filters/transaction_filters_panel.dart';

class _TransactionFiltersPanelStoryWrapper extends StatefulWidget {
  const _TransactionFiltersPanelStoryWrapper();

  @override
  State<_TransactionFiltersPanelStoryWrapper> createState() =>
      _TransactionFiltersPanelStoryWrapperState();
}

class _TransactionFiltersPanelStoryWrapperState
    extends State<_TransactionFiltersPanelStoryWrapper> {

  final TextEditingController _searchController = TextEditingController();

  TransactionTypeFilter _selectedType = TransactionTypeFilter.all;
  TransactionPeriodFilter _selectedPeriod = TransactionPeriodFilter.all;
  String? _selectedCategory;

  final List<String> _categories = const [
    'Alimentação',
    'Transporte',
    'Moradia',
    'Saúde',
    'Lazer',
    'Salário',
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _clearFilters() {
    setState(() {
      _selectedType = TransactionTypeFilter.all;
      _selectedPeriod = TransactionPeriodFilter.all;
      _selectedCategory = null;
      _searchController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: TransactionFiltersPanel(
          selectedType: _selectedType,
          selectedPeriod: _selectedPeriod,
          selectedCategory: _selectedCategory,
          searchController: _searchController,
          categories: _categories,

          onTypeChanged: (TransactionTypeFilter value) {
            setState(() => _selectedType = value);
          },

          onPeriodChanged: (TransactionPeriodFilter value) {
            setState(() => _selectedPeriod = value);
          },

          onCategoryChanged: (String? value) {
            setState(() => _selectedCategory = value);
          },

          onSearchChanged: (String _) {
            setState(() {});
          },

          onClearFilters: _clearFilters,
        ),
      ),
    );
  }
}

final List<Story> transactionFiltersPanelStories = [
  Story(
    name: 'Widgets/Transactions/TransactionFiltersPanel',
    description: 'Painel compacto de filtros das transações.',
    builder: (_) => const _TransactionFiltersPanelStoryWrapper(),
  ),
];