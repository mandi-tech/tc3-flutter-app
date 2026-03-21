import 'package:flutter/material.dart';

import '../../../../../../../features/home/presentation/widgets/charts/expenses_donut_chart.dart';
import '../../../../stories/widgets/story_preview_frame.dart';

class DonutChartPreview extends StatelessWidget {
  final Map<String, double> data;

  const DonutChartPreview({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return StoryPreviewFrame(
      height: 280,
      width: 350,
      title: 'Donut Chart',
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 300), 
            child: ExpensesDonutChart(data: data),
          ),
        ),
      ),
    );
  }
}