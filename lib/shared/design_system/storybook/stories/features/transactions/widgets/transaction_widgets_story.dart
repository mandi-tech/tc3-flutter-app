import 'package:storybook_flutter/storybook_flutter.dart';

import 'transaction_details_story.dart';
import 'transaction_filters_story.dart';
import 'transaction_group_story.dart';
import 'transaction_tile_story.dart';


final List<Story> transactionWidgetsStories = [
  ...transactionGroupSectionStories,
  ...transactionFiltersPanelStories,
  ...transactionTileStories,
  ...transactionDetailsStories,
];