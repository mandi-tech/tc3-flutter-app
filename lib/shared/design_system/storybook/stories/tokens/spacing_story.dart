import 'package:flutter/material.dart';

import '../../../tokens/app_spacing.dart';

import 'widgets/spacing_tile.dart';

class SpacingStory extends StatelessWidget {
  const SpacingStory({super.key});

  @override
  Widget build(BuildContext context) {
    final spacings = [
      ('xs', AppSpacing.xs),
      ('sm', AppSpacing.sm),
      ('md', AppSpacing.md),
      ('lg', AppSpacing.lg),
      ('xl', AppSpacing.xl),
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(AppSpacing.lg),
      itemCount: spacings.length,
      separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.md),
      itemBuilder: (_, index) {
        final item = spacings[index];
        return SpacingTile(
          name: item.$1,
          value: item.$2,
        );
      },
    );
  }
}