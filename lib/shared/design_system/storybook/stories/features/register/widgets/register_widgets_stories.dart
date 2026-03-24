import 'package:storybook_flutter/storybook_flutter.dart';

import 'register_form_story.dart';
import 'register_header_story.dart';

final List<Story> registerWidgetsStories = [
  registerHeaderStory,
  ...registerFormStories,
];