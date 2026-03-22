import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../shared/design_system/tokens/app_spacing.dart';
import '../controllers/transaction_controller.dart';
import '../controllers/transaction_filter_controller.dart';
import '../../domain/enums/transaction_type.dart';
import '../filters/transaction_filter.dart';
import '../mappers/transaction_group_mapper.dart';
import '../widgets/filters/transaction_filters_panel.dart';
import '../widgets/transaction_empty_state.dart';
import '../widgets/transaction_group_section.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<TransactionController>().startListening();
    });
  }

  @override
  Widget build(BuildContext context) {

    final controller = context.watch<TransactionController>();
    final filterController = context.watch<TransactionFilterController>();

    final filter = filterController.filter;

    final filteredTransactions = controller.transactions.where((transaction) {

      final matchesType = switch (filter.type) {
        TransactionTypeFilter.all => true,
        TransactionTypeFilter.income => transaction.type.isIncome,
        TransactionTypeFilter.expense => transaction.type.isExpense,
      };

      final matchesCategory =
          filter.category == null || transaction.category == filter.category;

      final matchesSearch =
          filter.searchQuery.isEmpty ||
          transaction.description
              .toLowerCase()
              .contains(filter.searchQuery.toLowerCase());

      return matchesType && matchesCategory && matchesSearch;

    }).toList();

    /// Agrupa
    final groups = TransactionGroupMapper.groupByDate(filteredTransactions);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Builder(
                builder: (_) {

                  if (controller.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (controller.errorMessage != null) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          controller.errorMessage!,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }

                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [

                        /// Filtros
                        TransactionFiltersPanel(
                          selectedType: filter.type,
                          selectedPeriod: filter.period,
                          selectedCategory: filter.category,
                          searchController:
                              filterController.searchController,

                          categories: controller.transactions
                              .map((t) => t.category)
                              .toSet()
                              .toList(),

                          onTypeChanged: filterController.setType,
                          onPeriodChanged: filterController.setPeriod,
                          onCategoryChanged: filterController.setCategory,
                          onSearchChanged: filterController.setSearch,
                          onClearFilters: filterController.clear,
                        ),

                        const SizedBox(height: AppSpacing.lg),

                        /// Lista
                        if (groups.isEmpty)
                          const TransactionEmptyState()
                        else
                          ...groups.map(
                            (group) => Padding(
                              padding: const EdgeInsets.only(
                                bottom: AppSpacing.lg,
                              ),
                              child: TransactionGroupSection(
                                group: group,
                                onDelete: (id) async {
                                  await controller.deleteTransaction(id);
                                },
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}