import 'package:flutter/material.dart';

import '../../../../../utils/theme_extensions.dart';
import '../../../../tokens/app_spacing.dart';

class StateStoryCard extends StatelessWidget {
  final Widget child;

  const StateStoryCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: context.colors.outlineVariant,
        ),
      ),
      child: child,
    );
  }
}