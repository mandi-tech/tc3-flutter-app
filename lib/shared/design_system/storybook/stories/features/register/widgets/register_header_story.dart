import 'package:storybook_flutter/storybook_flutter.dart';
import '../../../../previews/features/register/widgets/register_header_preview.dart';

final Story registerHeaderStory = Story(
  name: 'Widgets/Register/Register Header',
  description: 'Header estilizado com degradê para a tela de cadastro.',
  builder: (context) => const RegisterHeaderPreview(),
);