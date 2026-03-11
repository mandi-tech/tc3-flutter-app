import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../../components/app_email_field.dart';

final List<Story> appEmailFieldStories = [
  Story(
    name: 'Components/AppEmailField',
    description: 'Campo de e-mail padronizado.',
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
          child: AppEmailField(
            enabled: enabled,
            readOnly: readOnly,
          ),
        ),
      );
    },
  ),
];