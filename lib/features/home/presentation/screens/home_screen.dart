import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../shared/design_system/tokens/app_spacing.dart';
import '../../../transactions/presentation/controllers/transaction_controller.dart';
import '../widgets/balance_card.dart';
import '../widgets/dashboard_charts_section.dart';
import '../widgets/home_header.dart';
import '../widgets/monthly_summary_section.dart';
import '../widgets/quick_actions_section.dart';
import '../widgets/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: _HomeContent(),
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<TransactionController>();

    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        const HomeHeader(),
        const SizedBox(height: AppSpacing.lg),
        BalanceCard(balance: controller.balance),
        const SizedBox(height: AppSpacing.lg),
        const QuickActionsSection(),
        const SizedBox(height: AppSpacing.lg),
        const SectionTitle(title: 'Resumo do mês'),
        const SizedBox(height: AppSpacing.sm),
        MonthlySummarySection(
          income: controller.formattedCurrentMonthIncome,
          expense: controller.formattedCurrentMonthExpense,
        ),
        const SizedBox(height: AppSpacing.lg),
        DashboardChartsSection(
          controller: controller,
        ),
        const SizedBox(height: AppSpacing.lg),
      ],
    );
  }
}