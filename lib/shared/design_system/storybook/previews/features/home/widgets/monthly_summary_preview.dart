// monthly_summary_preview.dart
import 'package:flutter/material.dart';
import '../../../../../../../features/home/presentation/widgets/monthly_summary_section.dart';

class MonthlySummaryPreview extends StatelessWidget {
  final String income;
  final String expense;

  const MonthlySummaryPreview({
    super.key,
    required this.income,
    required this.expense,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( 
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 500,
              maxHeight: 150
            ), 
            child: MonthlySummarySection(
              income: income,
              expense: expense,
            ),
          ),
        ),
      ),
    );
  }
}