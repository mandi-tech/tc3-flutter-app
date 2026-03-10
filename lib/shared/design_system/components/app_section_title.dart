import 'package:flutter/material.dart';

import '../tokens/app_spacing.dart';
import '../tokens/app_typography.dart';

class AppSectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;

  const AppSectionTitle({
    super.key,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.title,
        ),
        if (subtitle != null) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(
            subtitle!,
            style: AppTypography.body,
          ),
        ],
      ],
    );
  }
}