import 'package:storybook_flutter/storybook_flutter.dart';

import 'features/profile/widgets/change_password_form_story.dart';
import 'features/auth/widgets/login_form_story.dart';
import 'features/register/widgets/register_form_story.dart';
import 'widgets/form_story_shell.dart';

final List<Story> formStories = [
  Story(
    name: 'Forms/Login Form',
    description: 'Formulário de login isolado.',
    builder: (_) => const FormStoryShell(
      title: 'Login Form',
      child: LoginFormStory(),
    ),
  ),
  Story(
    name: 'Forms/Register Form',
    description: 'Formulário de cadastro isolado.',
    builder: (_) => const FormStoryShell(
      title: 'Register Form',
      child: RegisterFormStory(),
    ),
  ),
  Story(
    name: 'Forms/Change Password Form',
    description: 'Formulário de alteração de senha.',
    builder: (_) => const FormStoryShell(
      title: 'Change Password Form',
      child: ChangePasswordFormStory(),
    ),
  ),
];