import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/design_system/tokens/app_colors.dart';
import '../../../../../shared/design_system/tokens/app_spacing.dart';
import '../../../../../shared/design_system/tokens/app_typography.dart';

class IncomeExpenseBarChart extends StatelessWidget {
  final Map<String, double> data;

  const IncomeExpenseBarChart({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final entries = data.entries.toList();

    final incomeColor = AppColors.income;
    final expenseColor = AppColors.expense;

    final maxValue =
        entries.map((e) => e.value).reduce((a, b) => a > b ? a : b);

    final maxY = _niceMax(maxValue);
    final interval = maxY / 4;

    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          maxY: maxY,
          borderData: FlBorderData(show: false),

          gridData: FlGridData(
            drawVerticalLine: false,
            horizontalInterval: interval,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: AppColors.neutral900.withOpacity(0.08),
                strokeWidth: 1,
              );
            },
          ),

          titlesData: FlTitlesData(
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),

            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),

            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  if (value.toInt() >= entries.length) {
                    return const SizedBox();
                  }

                  return Padding(
                    padding: const EdgeInsets.only(top: AppSpacing.sm),
                    child: Text(
                      entries[value.toInt()].key,
                      style: AppTypography.caption.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
              ),
            ),

            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                interval: interval,
                getTitlesWidget: (value, meta) {
                  return Text(
                    _formatCurrencyCompact(value),
                    style: AppTypography.caption,
                  );
                },
              ),
            ),
          ),

          barGroups: List.generate(entries.length, (index) {
            final entry = entries[index];
            final isIncome = entry.key == "Receitas";

            return BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  toY: entry.value,
                  width: 26,
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    colors: isIncome
                        ? [
                            incomeColor.withOpacity(0.85),
                            incomeColor,
                          ]
                        : [
                            expenseColor.withOpacity(0.85),
                            expenseColor,
                          ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ],
            );
          }),

          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              tooltipBorderRadius: BorderRadius.circular(12),
              tooltipPadding: const EdgeInsets.all(AppSpacing.sm),
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                return BarTooltipItem(
                  "R\$ ${rod.toY.toStringAsFixed(2)}",
                  AppTypography.caption.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                );
              },
            ),
          ),
        ),
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOut,
      ),
    );
  }

  /// cria um maxY "bonito" para o eixo
  double _niceMax(double value) {
    if (value <= 1000) return 1000;
    if (value <= 2000) return 2000;
    if (value <= 5000) return 5000;
    if (value <= 10000) return 10000;
    return (value / 1000).ceil() * 1000;
  }

  /// formata números compactos
  String _formatCurrencyCompact(double value) {
    if (value >= 1000) {
      return "${(value / 1000).toStringAsFixed(0)}k";
    }
    return value.toInt().toString();
  }
}