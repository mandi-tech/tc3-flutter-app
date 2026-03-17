import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../shared/design_system/tokens/app_spacing.dart';
import '../../../../shared/design_system/tokens/app_typography.dart';
import '../../../../shared/utils/theme_extensions.dart';

class BalanceCard extends StatelessWidget {
  final double balance;

  const BalanceCard({
    super.key,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
    );

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: context.colors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Saldo atual',
            style: AppTypography.body.copyWith(
              color: context.colors.onPrimary.withOpacity(0.72),
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            currency.format(balance),
            style: AppTypography.title.copyWith(
              fontSize: 28,
              color: context.colors.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}