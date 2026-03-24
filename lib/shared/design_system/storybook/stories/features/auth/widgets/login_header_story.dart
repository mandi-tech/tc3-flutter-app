import 'package:storybook_flutter/storybook_flutter.dart';
import '../../../../previews/features/auth/widgets/login_header_preview.dart';

final Story loginHeaderStory = Story(
  name: 'Widgets/Auth/Login Header',
  description: 'Cabeçalho de boas-vindas com gradiente suave.',
  builder: (context) => const LoginHeaderPreview(),
);