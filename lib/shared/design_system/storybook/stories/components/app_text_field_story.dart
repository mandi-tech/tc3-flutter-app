import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../../components/app_text_field.dart';
import '../../../tokens/app_colors.dart';

final List<Story> appTextFieldStories = [
  Story(
    name: 'Components/AppTextField',
    description: 'Campo de texto base do Design System.',
    builder: (context) {
      final label = context.knobs.text(
        label: 'Label',
        initial: 'Nome',
      );

      final hint = context.knobs.text(
        label: 'Hint',
        initial: 'Digite seu nome',
      );

      final enabled = context.knobs.boolean(
        label: 'Enabled',
        initial: true,
      );

      final readOnly = context.knobs.boolean(
        label: 'Read only',
        initial: false,
      );

      return Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 360),
          child: AppTextField(
            label: label,
            hintText: hint,
            enabled: enabled,
            readOnly: readOnly,
            prefixIcon: const Icon(
              Icons.person_outline_rounded,
              color: AppColors.secondary,
            ),
          ),
        ),
      );
    },
  ),
];