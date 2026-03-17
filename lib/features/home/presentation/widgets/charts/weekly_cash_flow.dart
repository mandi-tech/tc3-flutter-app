import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/design_system/tokens/app_colors.dart';
import '../../../../../shared/design_system/tokens/app_spacing.dart';
import '../../../../../shared/design_system/tokens/app_typography.dart';

class WeeklyCashflowChart extends StatelessWidget {
  final Map<int, double> data;

  const WeeklyCashflowChart({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {

    /// ESTADO VAZIO
    if (data.isEmpty) {
      return SizedBox(
        height: 200,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.show_chart,
                size: 36,
                color: Colors.grey.shade400,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                "Sem dados para exibir",
                style: AppTypography.caption.copyWith(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      );
    }

    final spots = data.entries
        .map((e) => FlSpot(e.key.toDouble(), e.value))
        .toList()
      ..sort((a, b) => a.x.compareTo(b.x));

    final values = spots.map((e) => e.y).toList();

    final maxValue = values.reduce((a, b) => a > b ? a : b);
    final minValue = values.reduce((a, b) => a < b ? a : b);

    final maxY = _niceMax(maxValue.abs());
    final minY = -_niceMax(minValue.abs());

    const days = ["S", "T", "Q", "Q", "S", "S", "D"];

    return SizedBox(
      height: 220,
      child: LineChart(
        LineChartData(
          minY: minY,
          maxY: maxY,

          /// GRID
          gridData: FlGridData(
            drawVerticalLine: false,
            horizontalInterval: maxY / 4,
            getDrawingHorizontalLine: (value) {

              /// LINHA CENTRAL (0)
              if (value == 0) {
                return FlLine(
                  color: Colors.grey.shade400,
                  strokeWidth: 1.5,
                );
              }

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

            /// DIAS DA SEMANA
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {

                  final index = value.toInt() - 1;

                  if (index < 0 || index >= days.length) {
                    return const SizedBox();
                  }

                  return Padding(
                    padding: const EdgeInsets.only(top: AppSpacing.sm),
                    child: Text(
                      days[index],
                      style: AppTypography.caption,
                    ),
                  );
                },
              ),
            ),

            /// VALORES
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: maxY / 4,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {

                  if (value == 0) {
                    return Text(
                      "0",
                      style: AppTypography.caption,
                    );
                  }

                  return Text(
                    _formatCurrencyCompact(value),
                    style: AppTypography.caption,
                  );
                },
              ),
            ),
          ),

          /// LINHA
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              curveSmoothness: 0.35,
              barWidth: 3,
              color: Colors.blueAccent,
              isStrokeCapRound: true,

              /// PONTOS
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) {

                  final isPositive = spot.y >= 0;

                  return FlDotCirclePainter(
                    radius: 4,
                    color: isPositive
                        ? AppColors.income
                        : AppColors.expense,
                    strokeWidth: 2,
                    strokeColor: Colors.white,
                  );
                },
              ),

              /// ÁREA
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    Colors.blueAccent.withOpacity(0.25),
                    Colors.blueAccent.withOpacity(0.02),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],

          /// TOOLTIP
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              tooltipBorderRadius: BorderRadius.circular(10),
              tooltipPadding: const EdgeInsets.all(AppSpacing.sm),
              getTooltipItems: (spots) {
                return spots.map((spot) {

                  final dayIndex = spot.x.toInt() - 1;

                  const dayNames = [
                    "Seg",
                    "Ter",
                    "Qua",
                    "Qui",
                    "Sex",
                    "Sáb",
                    "Dom"
                  ];

                  final day = (dayIndex >= 0 && dayIndex < 7)
                      ? dayNames[dayIndex]
                      : "";

                  final type = spot.y >= 0
                      ? "Receita"
                      : "Despesa";

                  return LineTooltipItem(
                    "$day\n$type: R\$ ${spot.y.abs().toStringAsFixed(2)}",
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
    if (value <= 100) return 100;
    if (value <= 500) return 500;
    if (value <= 1000) return 1000;
    if (value <= 2000) return 2000;
    if (value <= 5000) return 5000;
    return (value / 1000).ceil() * 1000;
  }

  String _formatCurrencyCompact(double value) {
    final abs = value.abs();

    if (abs >= 1000) {
      return "${(value / 1000).toStringAsFixed(1)}k";
    }

    return value.toInt().toString();
  }
}