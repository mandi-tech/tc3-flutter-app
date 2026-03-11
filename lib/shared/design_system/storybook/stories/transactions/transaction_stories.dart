import 'package:storybook_flutter/storybook_flutter.dart';

import 'balance_card_story.dart';
import 'transaction_empty_state_story.dart';
import 'transaction_filters_panel_story.dart';
import 'transaction_group_section_story.dart';
import 'transaction_tile_story.dart';

final List<Story> transactionStories = [
  ...transactionTileStories,
  ...balanceCardStories,
  ...transactionEmptyStateStories,
  ...transactionFiltersPanelStories,
  ...transactionGroupSectionStories,
];