import 'package:flutter/material.dart';

import '../../../../shared/design_system/tokens/app_colors.dart';
import '../../../../shared/design_system/tokens/app_spacing.dart';
import '../../domain/enums/transaction_type.dart';

class AddTransactionHeader extends StatelessWidget {
  final TransactionType type;

  const AddTransactionHeader({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final isIncome = type == TransactionType.income;

    final color = isIncome
        ? AppColors.success
        : AppColors.danger;
    final title = isIncome ? "Nova receita" : "Nova despesa";

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(
            isIncome ? Icons.arrow_upward : Icons.arrow_downward,
            color: color,
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}