import 'package:flutter/material.dart';
import '../../../../../../../features/home/presentation/widgets/charts/weekly_cash_flow.dart';
import '../../../../../tokens/app_spacing.dart';

class WeeklyCashflowChartPreview extends StatelessWidget {
  final Map<int, double> data;

  const WeeklyCashflowChartPreview({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: WeeklyCashflowChart(data: data),
            ),
          ),
        ),
      ),
    );
  }
}