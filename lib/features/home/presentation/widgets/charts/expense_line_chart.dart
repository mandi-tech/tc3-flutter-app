import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/design_system/tokens/app_colors.dart';
import '../../../../../shared/design_system/tokens/app_spacing.dart';
import '../../../../../shared/design_system/tokens/app_typography.dart';

class ExpensesLineChart extends StatelessWidget {
  final Map<int, double> data;

  const ExpensesLineChart({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final spots = data.entries
        .map((e) => FlSpot(e.key.toDouble(), e.value))
        .toList()
      ..sort((a, b) => a.x.compareTo(b.x));

    final color = AppColors.expense;

    final maxValue =
        spots.map((e) => e.y).reduce((a, b) => a > b ? a : b);

    final maxY = _niceMax(maxValue);
    final interval = _niceInterval(maxY);

    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          minY: 0,
          maxY: maxY,

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

          borderData: FlBorderData(show: false),

          titlesData: FlTitlesData(
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),

            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),

            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 5,
                getTitlesWidget: (value, meta) {
                  return Padding(
                    padding: const EdgeInsets.only(top: AppSpacing.sm),
                    child: Text(
                      value.toInt().toString().padLeft(2, '0'),
                      style: AppTypography.caption,
                    ),
                  );
                },
              ),
            ),

            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: interval,
                reservedSize: 36,
                getTitlesWidget: (value, meta) {
                  if (value == 0) return const SizedBox();

                  return Text(
                    _formatCurrencyCompact(value),
                    style: AppTypography.caption,
                  );
                },
              ),
            ),
          ),

          lineBarsData: [
            LineChartBarData(
              spots: spots,

              isCurved: true,
              curveSmoothness: 0.35,

              barWidth: 3,
              color: color,
              isStrokeCapRound: true,

              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) {
                  return FlDotCirclePainter(
                    radius: 3,
                    color: color,
                    strokeWidth: 2,
                    strokeColor: Colors.white,
                  );
                },
              ),

              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    color.withOpacity(0.25),
                    color.withOpacity(0.02),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],

          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              tooltipBorderRadius: BorderRadius.circular(10),
              tooltipPadding: const EdgeInsets.all(AppSpacing.sm),
              getTooltipItems: (spots) {
                return spots.map((spot) {
                  return LineTooltipItem(
                    "Dia ${spot.x.toInt()}\nR\$ ${spot.y.toStringAsFixed(2)}",
                    AppTypography.caption.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  );
                }).toList();
              },
            ),
          ),
        ),
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOut,
      ),
    );
  }

  double _niceMax(double value) {
    if (value <= 1000) return 1000;
    if (value <= 2000) return 2000;
    if (value <= 5000) return 5000;
    if (value <= 10000) return 10000;
    return (value / 1000).ceil() * 1000;
  }

  double _niceInterval(double maxY) {
    if (maxY <= 1000) return 250;
    if (maxY <= 2000) return 500;
    if (maxY <= 5000) return 1000;
    if (maxY <= 10000) return 2000;
    return 5000;
  }

  String _formatCurrencyCompact(double value) {
    if (value >= 1000) {
      return "${(value / 1000).toStringAsFixed(1)}k";
    }
    return value.toInt().toString();
  }
}