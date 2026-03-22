import 'package:storybook_flutter/storybook_flutter.dart';

import 'components/app_button_states_story.dart';
import 'features/auth/login_form_error_state_story.dart';

final List<Story> componentStateStories = [
  Story(
    name: 'States/AppButton',
    description: 'Estados visuais do AppButton.',
    builder: (_) => const AppButtonStatesStory(),
  ),
  Story(
    name: 'States/Login Form - Error',
    description: 'Estado de erro do formulário de login.',
    builder: (_) => const LoginFormErrorStateStory(),
  ),
];