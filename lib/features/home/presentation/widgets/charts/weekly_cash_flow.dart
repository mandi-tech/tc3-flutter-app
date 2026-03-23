import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

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
    final colorScheme = Theme.of(context).colorScheme;

    if (data.isEmpty) {
      return _buildEmptyState();
    }

    /// Transforma em saldo acumulado
    double runningBalance = 0;
    final List<FlSpot> accumulatedSpots = [];
    
    /// Ordena os dias de 1 a 7
    final sortedKeys = data.keys.toList()..sort();
    
    for (var day in sortedKeys) {
      runningBalance += data[day] ?? 0;
      accumulatedSpots.add(FlSpot(day.toDouble(), runningBalance));
    }

    /// Calcula máximos e mínimos para o eixo Y
    final allValues = accumulatedSpots.map((e) => e.y).toList();
    final maxValue = allValues.reduce((a, b) => a > b ? a : b);
    final minValue = allValues.reduce((a, b) => a < b ? a : b);

    /// Ajusta o maxY para ter um respiro no topo e o minY para 0 (ou o mínimo real)
    final maxY = _niceMax(maxValue * 1.2); 
    final minY = minValue < 0 ? minValue * 1.1 : 0.0;

    const days = ["S", "T", "Q", "Q", "S", "S", "D"];

    return SizedBox(
      height: 220,
      child: LineChart(
        LineChartData(
          minY: minY,
          maxY: maxY,
          gridData: FlGridData(
            drawVerticalLine: false,
            horizontalInterval: (maxY - minY) / 4 == 0 ? 1 : (maxY - minY) / 4,
            getDrawingHorizontalLine: (value) => FlLine(
              color: colorScheme.outlineVariant.withOpacity(0.4),
              strokeWidth: 1,
            ),
          ),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt() - 1;
                  if (index < 0 || index >= days.length) return const SizedBox();
                  return Padding(
                    padding: const EdgeInsets.only(top: AppSpacing.sm),
                    child: Text(days[index], style: AppTypography.caption.copyWith(color: colorScheme.onSurfaceVariant)),
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: (maxY - minY) / 4 == 0 ? 1 : (maxY - minY) / 4,
                reservedSize: 42,
                getTitlesWidget: (value, meta) => Text(
                  _formatCurrencyCompact(value),
                  style: AppTypography.caption.copyWith(color: colorScheme.onSurfaceVariant),
                ),
              ),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: accumulatedSpots,
              isCurved: true,
              curveSmoothness: 0.3,
              barWidth: 4,
              color: colorScheme.primary, 
              isStrokeCapRound: true,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
                  radius: 4,
                  color: colorScheme.primary,
                  strokeWidth: 2,
                  strokeColor: colorScheme.surface,
                ),
              ),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    colorScheme.primary.withOpacity(0.3),
                    colorScheme.primary.withOpacity(0.0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              getTooltipColor:(touchedSpot) => colorScheme.surfaceContainerHighest,
              getTooltipItems: (touchedSpots) {
                return touchedSpots.map((spot) {
                  return LineTooltipItem(
                    "Saldo: R\$ ${spot.y.toStringAsFixed(2)}",
                    AppTypography.caption.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }).toList();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return SizedBox(
      height: 200,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.show_chart, size: 36, color: Colors.grey),
            const SizedBox(height: AppSpacing.sm),
            Text("Sem movimentações esta semana", style: AppTypography.caption),
          ],
        ),
      ),
    );
  }

  double _niceMax(double value) {
    if (value <= 0) return 100;
    if (value <= 1000) return 1000;
    return (value / 500).ceil() * 500.0;
  }

  String _formatCurrencyCompact(double value) {
    if (value.abs() >= 1000) return "${(value / 1000).toStringAsFixed(1)}k";
    return value.toInt().toString();
  }
}