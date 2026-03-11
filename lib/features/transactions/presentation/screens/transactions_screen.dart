import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../shared/design_system/tokens/app_spacing.dart';
import '../controllers/transaction_controller.dart';
import '../widgets/balance_card.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transações'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            BalanceCard(balance: controller.balance),
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

                  final groups = controller.groupedFilteredTransactions;

                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TransactionFiltersPanel(
                          selectedType: controller.filter.type,
                          selectedPeriod: controller.filter.period,
                          selectedCategory: controller.filter.category,
                          searchController: controller.searchController,
                          categories: controller.availableCategories,
                          onTypeChanged: controller.setTypeFilter,
                          onPeriodChanged: controller.setPeriodFilter,
                          onCategoryChanged: controller.setCategoryFilter,
                          onSearchChanged: controller.setSearchQuery,
                          onClearFilters: controller.clearFilters,
                        ),
                        const SizedBox(height: AppSpacing.lg),
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