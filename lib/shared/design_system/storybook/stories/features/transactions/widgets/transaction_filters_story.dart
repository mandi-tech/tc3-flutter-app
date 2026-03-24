import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import '../../../../../../../features/transactions/presentation/filters/transaction_filter.dart';
import '../../../../../../../features/transactions/presentation/widgets/filters/transaction_filters_panel.dart';
import '../../../../previews/features/transactions/widgets/transaction_filters_preview.dart';

class TransactionFiltersPanelStory extends StatefulWidget {
  const TransactionFiltersPanelStory({super.key});

  @override
  State<TransactionFiltersPanelStory> createState() => _TransactionFiltersPanelStoryState();
}

class _TransactionFiltersPanelStoryState extends State<TransactionFiltersPanelStory> {
  final TextEditingController _searchController = TextEditingController();
  TransactionTypeFilter _selectedType = TransactionTypeFilter.all;
  TransactionPeriodFilter _selectedPeriod = TransactionPeriodFilter.all;
  String? _selectedCategory;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TransactionFiltersPreview(
      child: TransactionFiltersPanel(
        selectedType: _selectedType,
        selectedPeriod: _selectedPeriod,
        selectedCategory: _selectedCategory,
        searchController: _searchController,
        categories: const ['Alimentação', 'Transporte', 'Moradia', 'Saúde', 'Lazer', 'Salário'],
        onTypeChanged: (v) => setState(() => _selectedType = v),
        onPeriodChanged: (v) => setState(() => _selectedPeriod = v),
        onCategoryChanged: (v) => setState(() => _selectedCategory = v),
        onSearchChanged: (v) => setState(() {}),
        onClearFilters: () => setState(() {
          _selectedType = TransactionTypeFilter.all;
          _selectedPeriod = TransactionPeriodFilter.all;
          _selectedCategory = null;
          _searchController.clear();
        }),
      ),
    );
  }
}

final List<Story> transactionFiltersPanelStories = [
  Story(
    name: 'Widgets/Transactions/Filters Panel',
    description: 'Painel de filtros isolado e adaptável.',
    builder: (context) => const TransactionFiltersPanelStory(),
  ),
];