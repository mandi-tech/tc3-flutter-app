import 'package:flutter/material.dart';

import '../../../../shared/design_system/tokens/app_typography.dart';
import '../../../../shared/utils/theme_extensions.dart';

class HomeHeader extends StatelessWidget {

  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Aqui está o resumo das suas finanças',
                style: AppTypography.body.copyWith(
                  color: context.colors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}