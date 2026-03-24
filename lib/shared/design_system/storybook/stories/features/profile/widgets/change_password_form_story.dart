import 'package:storybook_flutter/storybook_flutter.dart';
import '../../../../previews/features/profile/widgets/change_password_form_preview.dart';

final Story changePasswordFormStory = Story(
  name: 'Widgets/Profile/Change Password Form',
  description: 'Formulário de troca de senha com o padrão Surface.',
  builder: (context) {
    final isLoading = context.knobs.boolean(label: 'Carregando?', initial: false);

    return ChangePasswordFormPreview(
      isLoading: isLoading,
    );
  },
);