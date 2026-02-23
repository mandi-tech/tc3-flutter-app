import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import 'shared/design_system/components/app_button.dart';
import 'shared/design_system/tokens/app_colors.dart';

void main() => runApp(const StorybookApp());

class StorybookApp extends StatelessWidget {
  const StorybookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Storybook(
      stories: [
        Story(
          name: 'Buttons/AppButton',
          description: 'Botão do Design System com variações.',
          builder: (context) {
            final label = context.knobs.text(label: 'Label', initial: 'Salvar');
            final enabled =
                context.knobs.boolean(label: 'Enabled', initial: true);
            final isLoading =
                context.knobs.boolean(label: 'Loading', initial: false);

            return Center(
              child: AppButton(
                label: label,
                enabled: enabled,
                isLoading: isLoading,
                onPressed: enabled && !isLoading ? () {} : null,
              ),
            );
          },
        ),
        Story(
          name: 'Tokens/Colors',
          description: 'Paleta do Design System.',
          builder: (_) => _ColorsStory(),
        ),
      ],
    );
  }
}

class _ColorsStory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = [
      AppColors.primary,
      AppColors.success,
      AppColors.warning,
      AppColors.danger,
      AppColors.neutral900,
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: colors.length,
      itemBuilder: (_, i) => Container(
        height: 56,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: colors[i],
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}