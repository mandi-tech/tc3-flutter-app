import 'package:storybook_flutter/storybook_flutter.dart';
import '../../../../previews/features/register/widgets/register_form_preview.dart';

final List<Story> registerFormStories = [
  Story(
    name: 'Widgets/Register/Register Form',
    description: 'Formulário completo de criação de conta com validações.',
    builder: (context) {
      // Você pode adicionar knobs aqui para passar para o RegisterFormPreview 
      // se quiser forçar estados de erro ou loading por fora.
      return const RegisterFormPreview();
    },
  ),
];