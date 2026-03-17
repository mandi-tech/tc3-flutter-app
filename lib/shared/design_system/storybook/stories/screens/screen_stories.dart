import 'package:storybook_flutter/storybook_flutter.dart';

import 'account_screen_story.dart';
import 'home_screen_story.dart';
import 'login_screen_story.dart';
import 'main_navigation_screen_story.dart';
import 'profile_screen_story.dart';
import 'register_screen_story.dart';

final List<Story> screenStories = [
  ...loginScreenStories,
  ...registerScreenStories,
  ...mainNavigationScreenStories,
  ...accountScreenStories,
  ...profileScreenStories,
  homeScreenStory,
];