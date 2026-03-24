import 'package:storybook_flutter/storybook_flutter.dart';

import 'features/auth/widgets/auth_widgets_stories.dart';
import 'features/home/widgets/home_widgets_stories.dart';
import 'features/profile/widgets/profile_widgets_stories.dart';
import 'features/register/widgets/register_widgets_stories.dart';
import 'features/transactions/widgets/transaction_filters_story.dart';
import 'features/transactions/widgets/transaction_group_section_story.dart';
import 'features/transactions/widgets/transaction_tile_story.dart';

final List<Story> widgetStories = [

  ...transactionFiltersPanelStories,
  ...transactionGroupSectionStories,
  ...transactionTileStories,

  ...registerWidgetsStories,
  ...authWidgetsStories,
  ...homeWidgetsStories,
  ...profileWidgetsStories
];