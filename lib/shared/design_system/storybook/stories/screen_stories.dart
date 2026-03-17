import 'package:storybook_flutter/storybook_flutter.dart';

import 'features/profile/account_screen_story.dart';
import 'features/home/home_screen_story.dart';
import 'features/auth/login_screen_story.dart';
import 'features/navigation/main_navigation_screen_story.dart';
import 'features/profile/profile_screen_story.dart';
import 'features/register/register_screen_story.dart';

final List<Story> screenStories = [
  ...loginScreenStories,
  ...registerScreenStories,
  ...mainNavigationScreenStories,
  ...accountScreenStories,
  ...profileScreenStories,
  homeScreenStory,
];