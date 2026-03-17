import 'package:flutter/material.dart';

import '../../../components/app_button.dart';
import '../../../tokens/app_spacing.dart';
import 'widgets/state_story_center.dart';

class AppButtonStatesStory extends StatelessWidget {
  const AppButtonStatesStory({super.key});

  @override
  Widget build(BuildContext context) {
    return const StateStoryCenter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppButton(
            label: 'Primary',
            onPressed: _noop,
          ),
          SizedBox(height: AppSpacing.md),
          AppButton(
            label: 'Secondary',
            variant: AppButtonVariant.secondary,
            onPressed: _noop,
          ),
          SizedBox(height: AppSpacing.md),
          AppButton(
            label: 'Danger',
            variant: AppButtonVariant.danger,
            onPressed: _noop,
          ),
          SizedBox(height: AppSpacing.md),
          AppButton(
            label: 'Loading',
            isLoading: true,
            onPressed: _noop,
          ),
          SizedBox(height: AppSpacing.md),
          AppButton(
            label: 'Disabled',
            enabled: false,
            onPressed: _noop,
          ),
        ],
      ),
    );
  }
}

void _noop() {}