import 'package:flutter/material.dart';
import '../../../../../../../features/home/presentation/widgets/charts/expenses_donut_chart.dart';
import '../../../../../../../features/home/presentation/widgets/charts/weekly_cash_flow.dart';
import '../../../../../tokens/app_spacing.dart';
import '../../../../../tokens/app_typography.dart';
import '../../widgets/state_story_center.dart';

class HomeChartsStatesStory extends StatelessWidget {
  const HomeChartsStatesStory({super.key});

  @override
  Widget build(BuildContext context) {
    return StateStoryCenter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildLabel("Donut Chart - Com Dados"),
          const ExpensesDonutChart(
            data: {'Alimentação': 400, 'Lazer': 150, 'Outros': 100},
          ),
          
          const SizedBox(height: AppSpacing.lg),
          _buildLabel("Donut Chart - Sem Dados"),
          const ExpensesDonutChart(data: {}),

          const Divider(height: AppSpacing.xl),

          _buildLabel("Weekly Chart - Com Dados"),
          const WeeklyCashflowChart(
            data: {1: 100, 2: 200, 3: -50, 4: 300},
          ),

          const SizedBox(height: AppSpacing.lg),
          _buildLabel("Weekly Chart - Sem Dados"),
          const WeeklyCashflowChart(data: {}),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xs),
      child: Text(
        text,
        style: AppTypography.caption.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}