import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../../../../../../features/profile/presentation/widgets/settings_item.dart';

final Story settingsItemStory = Story(
  name: 'Widgets/Profile/Settings Item',
  builder: (context) {
    return Center(
      child: SettingsItem(
        icon: Icons.person_outline,
        label: context.knobs.text(label: 'Texto', initial: 'Perfil'),
        iconColor: context.knobs.options(
          label: 'Cor do Ícone',
          initial: null,
          options: [
            const Option(label: 'Padrão', value: null),
            const Option(label: 'Perigo', value: Colors.red),
          ],
        ),
        onTap: () {},
      ),
    );
  },
);