import 'package:flutter/material.dart';

import '../../../../shared/design_system/tokens/app_spacing.dart';
import '../../../transactions/presentation/controllers/transaction_controller.dart';
import 'charts/expenses_donut_chart.dart';
import 'charts/weekly_cash_flow.dart';

class DashboardChartsSection extends StatelessWidget {
  final TransactionController controller;

  const DashboardChartsSection({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ChartCard(
          title: 'Gastos por categoria',
          child: SizedBox(
            height: 240,
            child: ExpensesDonutChart(
              data: controller.expensesByCategory,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        _ChartCard(
          title: 'Movimentações da semana',
          child: SizedBox(
            height: 220,
            child: WeeklyCashflowChart(
              data: controller.weeklyCashFlow,
            )
          ),
        ),
      ],
    );
  }
}

class _ChartCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _ChartCard({
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: AppSpacing.lg),
            child,
          ],
        ),
      ),
    );
  }
}