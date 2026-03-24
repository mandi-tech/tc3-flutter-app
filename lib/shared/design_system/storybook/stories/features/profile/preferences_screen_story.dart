import 'package:storybook_flutter/storybook_flutter.dart';

import '../../../previews/features/profile/preferences_screen_preview.dart';

final Story preferencesScreenStory = Story(
  name: 'Screens/Preferences (Static)',
  description: 'Visualização da tela de preferências sem lógica de tema.',
  builder: (context) {
    final systemMode = context.knobs.boolean(
      label: 'Tema do Sistema', 
      initial: true
    );

    return PreferencesScreenPreview(
      isSystemMode: systemMode,
    );
  },
);