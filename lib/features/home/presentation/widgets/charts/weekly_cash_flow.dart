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

    /// Ordem visual: Domingo (7) até Sábado (6)
    final weekOrder = [7, 1, 2, 3, 4, 5, 6];
    const daysLabels = ["D", "S", "T", "Q", "Q", "S", "S"];

    /// Pegamos o dia atual para limitar o gráfico
    final now = DateTime.now();
    final todayWeekday = now.weekday; 
    /// Ajustamos o dia de hoje para o índice do nosso array (Dom = 0, Seg = 1...)
    final todayIndex = todayWeekday == 7 ? 0 : todayWeekday;

    double runningBalance = 0;
    final List<FlSpot> accumulatedSpots = [];
    
    for (int i = 0; i < weekOrder.length; i++) {
      /// Se o índice for maior que hoje, paramos de adicionar pontos
      if (i > todayIndex) break;

      final dayKey = weekOrder[i];
      runningBalance += data[dayKey] ?? 0;
      accumulatedSpots.add(FlSpot(i.toDouble(), runningBalance));
    }

    /// Se por algum motivo a lista estiver vazia após o filtro, build state vazio
    if (accumulatedSpots.isEmpty) return _buildEmptyState();

    final allValues = accumulatedSpots.map((e) => e.y).toList();
    final maxValue = allValues.reduce((a, b) => a > b ? a : b);
    final minValue = allValues.reduce((a, b) => a < b ? a : b);

    final maxY = _niceMax(maxValue * 1.2); 
    final minY = minValue < 0 ? minValue * 1.1 : 0.0;

    return SizedBox(
      height: 220,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 6, /// Mantemos 6 para o eixo mostrar a semana toda
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
                  final index = value.toInt();
                  if (index < 0 || index >= daysLabels.length) return const SizedBox();
                  
                  final isToday = index == todayIndex;

                  return Padding(
                    padding: const EdgeInsets.only(top: AppSpacing.sm),
                    child: Text(
                      daysLabels[index], 
                      style: AppTypography.caption.copyWith(
                        color: isToday ? colorScheme.primary : colorScheme.onSurfaceVariant,
                        fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
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
              dotData: const FlDotData(show: true),
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
              getTooltipColor: (touchedSpot) => colorScheme.surfaceContainerHighest,
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