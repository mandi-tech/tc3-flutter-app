import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tc3_flutter_app/shared/design_system/storybook/stories/features/profile/preferences_screen_story.dart';
import 'package:tc3_flutter_app/shared/design_system/storybook/stories/features/splash/splash_screen_story.dart';
import 'package:tc3_flutter_app/shared/design_system/storybook/stories/features/transactions/add_transaction_story.dart';
import 'package:tc3_flutter_app/shared/design_system/storybook/stories/features/transactions/transaction_screen_story.dart';

import 'features/profile/account_screen_story.dart';
import 'features/home/home_screen_stories.dart';
import 'features/auth/login_screen_stories.dart';
import 'features/navigation/main_navigation_stories.dart';
import 'features/profile/change_password_screen_story.dart';
import 'features/profile/profile_screen_story.dart';
import 'features/register/register_screen_story.dart';

final List<Story> screenStories = [
  ...loginScreenStories,
  ...registerScreenStories,
  ...mainNavigationStories,
  ...homeScreenStories,
  splashScreenStory,
  ...addTransactionStories,
  ...transactionsStories,

  ///Profile
  changePasswordScreenStory,
  ...accountScreenStories,
  ...profileScreenStories,
  preferencesScreenStory,

];