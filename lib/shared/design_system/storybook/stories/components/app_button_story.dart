import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../../components/app_button.dart';

final List<Story> appButtonStories = [
  Story(
    name: 'Components/AppButton',
    description: 'Botão do Design System com variações e estados.',
    builder: (context) {
      final label = context.knobs.text(
        label: 'Label',
        initial: 'Salvar',
      );
      final enabled = context.knobs.boolean(
        label: 'Enabled',
        initial: true,
      );
      final isLoading = context.knobs.boolean(
        label: 'Loading',
        initial: false,
      );
      final variant = context.knobs.options<AppButtonVariant>(
        label: 'Variant',
        initial: AppButtonVariant.primary,
        options: const [
          Option(label: 'Primary', value: AppButtonVariant.primary),
          Option(label: 'Secondary', value: AppButtonVariant.secondary),
          Option(label: 'Danger', value: AppButtonVariant.danger),
        ],
      );

      return Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 320),
          child: AppButton(
            label: label,
            enabled: enabled,
            isLoading: isLoading,
            variant: variant,
            onPressed: enabled && !isLoading ? () {} : null,
          ),
        ),
      );
    },
  ),
];