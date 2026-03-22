import 'package:storybook_flutter/storybook_flutter.dart';
import '../../../../previews/features/register/widgets/register_form_preview.dart';

final List<Story> registerFormStories = [
  Story(
    name: 'Widgets/Register/Register Form',
    description: 'Formulário completo de criação de conta.',
    builder: (context) {
      return RegisterFormPreview();
    },
  ),
];