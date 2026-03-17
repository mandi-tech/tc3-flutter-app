import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/design_system/tokens/app_colors.dart';
import '../../../../../shared/design_system/tokens/app_spacing.dart';
import '../../../../../shared/design_system/tokens/app_typography.dart';

class ExpensesDonutChart extends StatelessWidget {
  final Map<String, double> data;

  const ExpensesDonutChart({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const SizedBox(
        height: 180,
        child: Center(
          child: Text(
            "Sem dados para exibir",
            style: AppTypography.body,
          ),
        ),
      );
    }

    final entries = data.entries.toList();
    final total = entries.fold<double>(0, (sum, e) => sum + e.value);

    final colors = AppColors.categorySwatch;

    return Column(
      children: [
        SizedBox(
          height: 180,
          child: PieChart(
            PieChartData(
              sectionsSpace: 4,
              centerSpaceRadius: 36,
              sections: List.generate(entries.length, (index) {
                final entry = entries[index];
                final percentage = (entry.value / total) * 100;

                return PieChartSectionData(
                  value: entry.value,
                  title: percentage > 10
                      ? "${percentage.toStringAsFixed(0)}%"
                      : '',
                  radius: 52,
                  color: colors[index % colors.length],
                  titleStyle: AppTypography.caption.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                );
              }),
            ),
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOut,
          ),
        ),

        const SizedBox(height: AppSpacing.lg),

        /// legenda
        Wrap(
          alignment: WrapAlignment.center,
          spacing: AppSpacing.lg,
          runSpacing: AppSpacing.sm,
          children: List.generate(entries.length, (index) {
            final entry = entries[index];

            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: colors[index % colors.length],
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  entry.key,
                  style: AppTypography.caption,
                ),
              ],
            );
          }),
        ),
      ],
    );
  }
}