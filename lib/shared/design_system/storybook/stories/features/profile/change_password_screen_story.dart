import 'package:storybook_flutter/storybook_flutter.dart';
import '../../../previews/features/profile/change_password_screen_preview.dart';

final Story changePasswordScreenStory = Story(
  name: 'Screens/Change Password',
  description: 'Tela completa de alteração de senha dentro das configurações.',
  builder: (context) {
    final isLoading = context.knobs.boolean(
      label: 'Estado de Carregamento', 
      initial: false,
    );

    return ChangePasswordScreenPreview(
      isLoading: isLoading,
    );
  },
);