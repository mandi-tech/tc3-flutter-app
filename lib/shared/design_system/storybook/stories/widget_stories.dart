import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tc3_flutter_app/shared/design_system/storybook/stories/features/transactions/widgets/transaction_widgets_story.dart';

import 'features/auth/widgets/auth_widgets_stories.dart';
import 'features/home/widgets/home_widgets_stories.dart';
import 'features/profile/widgets/profile_widgets_stories.dart';
import 'features/register/widgets/register_widgets_stories.dart';

final List<Story> widgetStories = [
  ...registerWidgetsStories,
  ...authWidgetsStories,
  ...homeWidgetsStories,
  ...profileWidgetsStories,
  ...transactionWidgetsStories
];