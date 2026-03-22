import 'package:storybook_flutter/storybook_flutter.dart';

import 'features/profile/widgets/change_password_form_story.dart';
import 'features/auth/widgets/login_form_story.dart';
import 'widgets/form_story_shell.dart';

final List<Story> formStories = [
  Story(
    name: 'Widgets/Auth/Login Form',
    description: 'Formulário de login isolado.',
    builder: (_) => const FormStoryShell(
      title: 'Login Form',
      child: LoginFormStory(),
    ),
  ),
  Story(
    name: 'Widgets/Profile/Change Password Form',
    description: 'Formulário de alteração de senha isolado',
    builder: (_) => const FormStoryShell(
      title: 'Change Password Form',
      child: ChangePasswordFormStory(),
    ),
  ),
];