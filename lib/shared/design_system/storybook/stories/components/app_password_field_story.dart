import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../../components/app_password_field.dart';

final List<Story> appPasswordFieldStories = [
  Story(
    name: 'Components/AppPasswordField',
    description: 'Campo de senha com mostrar/ocultar.',
    builder: (context) {
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
          child: AppPasswordField(
            enabled: enabled,
            readOnly: readOnly,
          ),
        ),
      );
    },
  ),
];