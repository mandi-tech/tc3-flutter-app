import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import '../../../../../tokens/app_colors.dart';
import '../../../../previews/features/profile/widgets/settings_card_preview.dart';

final Story settingsCardStory = Story(
  name: 'Widgets/Profile/Settings Item Card',
  description: 'O item individual de configuração com seu container arredondado.',
  builder: (context) {
    final isDanger = context.knobs.boolean(label: 'Estilo de Erro/Sair', initial: false);

    return SettingsCardPreview(
      icon: isDanger ? Icons.logout : Icons.person_outline,
      label: isDanger ? 'Sair' : 'Dados da conta',
      iconColor: isDanger ? AppColors.danger : null,
      textColor: isDanger ? AppColors.danger : null,
    );
  },
);