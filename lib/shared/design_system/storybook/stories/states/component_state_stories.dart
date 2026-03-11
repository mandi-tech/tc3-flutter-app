import 'package:storybook_flutter/storybook_flutter.dart';

import 'app_button_states_story.dart';
import 'app_fields_states_story.dart';
import 'login_form_error_state_story.dart';
import 'main_navigation_bar_states_story.dart';

final List<Story> componentStateStories = [
  Story(
    name: 'States/AppButton',
    description: 'Estados visuais do AppButton.',
    builder: (_) => const AppButtonStatesStory(),
  ),
  Story(
    name: 'States/AppFields',
    description: 'Estados visuais dos campos.',
    builder: (_) => const AppFieldsStatesStory(),
  ),
  Story(
    name: 'States/MainNavigationBar',
    description: 'Estados visuais da navbar com cada aba selecionada.',
    builder: (_) => const MainNavigationBarStatesStory(),
  ),
  Story(
    name: 'States/Login Form - Error',
    description: 'Estado de erro do formulário de login.',
    builder: (_) => const LoginFormErrorStateStory(),
  ),
];