import 'package:flutter/material.dart';

import '../../../../shared/design_system/tokens/app_colors.dart';

class SettingsCard extends StatelessWidget {
  final List<Widget> children;

  const SettingsCard({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.neutral100,
        ),
      ),
      child: Column(children: children),
    );
  }
}