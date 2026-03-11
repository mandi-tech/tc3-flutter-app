import 'package:flutter/material.dart';

import '../../../../../shared/design_system/tokens/app_spacing.dart';
import '../../utils/transaction_filter.dart';
import 'transaction_category_filter.dart';
import 'transaction_filters_summary.dart';
import 'transaction_period_filter.dart';
import 'transaction_search_field.dart';
import 'transaction_type_filter.dart';

class TransactionFiltersPanel extends StatefulWidget {
  final TransactionTypeFilter selectedType;
  final TransactionPeriodFilter selectedPeriod;
  final String? selectedCategory;
  final TextEditingController searchController;
  final List<String> categories;
  final ValueChanged<TransactionTypeFilter> onTypeChanged;
  final ValueChanged<TransactionPeriodFilter> onPeriodChanged;
  final ValueChanged<String?> onCategoryChanged;
  final ValueChanged<String> onSearchChanged;
  final VoidCallback onClearFilters;

  const TransactionFiltersPanel({
    super.key,
    required this.selectedType,
    required this.selectedPeriod,
    required this.selectedCategory,
    required this.searchController,
    required this.categories,
    required this.onTypeChanged,
    required this.onPeriodChanged,
    required this.onCategoryChanged,
    required this.onSearchChanged,
    required this.onClearFilters,
  });

  @override
  State<TransactionFiltersPanel> createState() =>
      _TransactionFiltersPanelState();
}

class _TransactionFiltersPanelState extends State<TransactionFiltersPanel> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
                child: Row(
                  children: [
                    const Icon(Icons.filter_list),
                    const SizedBox(width: AppSpacing.sm),
                    const Expanded(
                      child: Text(
                        'Filtros',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Icon(
                      _isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            TransactionFiltersSummary(
              selectedType: widget.selectedType,
              selectedPeriod: widget.selectedPeriod,
              selectedCategory: widget.selectedCategory,
              searchQuery: widget.searchController.text,
            ),
            if (_isExpanded) ...[
              const SizedBox(height: AppSpacing.md),
              TransactionSearchField(
                controller: widget.searchController,
                onChanged: widget.onSearchChanged,
              ),
              const SizedBox(height: AppSpacing.md),
              Container(
                alignment: Alignment.center,
                child: TransactionTypeFilterWidget(
                  selectedType: widget.selectedType,
                  onChanged: widget.onTypeChanged,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              TransactionPeriodDropdown(
                selectedPeriod: widget.selectedPeriod,
                onChanged: widget.onPeriodChanged,
              ),
              const SizedBox(height: AppSpacing.md),
              TransactionCategoryDropdown(
                selectedCategory: widget.selectedCategory,
                categories: widget.categories,
                onChanged: widget.onCategoryChanged,
              ),
              const SizedBox(height: AppSpacing.xs),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: widget.onClearFilters,
                  child: const Text('Limpar filtros'),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}