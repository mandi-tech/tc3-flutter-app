
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tc3_flutter_app/shared/design_system/storybook/stories/features/register/widgets/register_form_story.dart';

import 'features/home/widgets/balance_card_story.dart';
import 'features/home/widgets/donut_chart_story.dart';
import 'features/transactions/widgets/transaction_filters_panel_story.dart';
import 'features/transactions/widgets/transaction_group_section_story.dart';
import 'features/transactions/widgets/transaction_tile_story.dart';

final List<Story> widgetStories = [
  donutChartStory, 
  ...balanceCardStory,
  ...transactionFiltersPanelStories,
  ...transactionGroupSectionStories,
  ...transactionTileStories,
  ...registerFormStories
];