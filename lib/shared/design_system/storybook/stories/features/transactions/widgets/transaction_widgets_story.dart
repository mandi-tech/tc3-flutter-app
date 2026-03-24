import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tc3_flutter_app/shared/design_system/storybook/stories/features/transactions/widgets/transaction_filters_story.dart';
import 'package:tc3_flutter_app/shared/design_system/storybook/stories/features/transactions/widgets/transaction_group_story.dart';
import 'package:tc3_flutter_app/shared/design_system/storybook/stories/features/transactions/widgets/transaction_tile_story.dart';


final List<Story> transactionWidgetsStories = [
  ...transactionGroupSectionStories,
  ...transactionFiltersPanelStories,
  ...transactionTileStories
];