import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tc3_flutter_app/shared/design_system/storybook/stories/features/home/widgets/balance_card_story.dart';
import 'package:tc3_flutter_app/shared/design_system/storybook/stories/features/home/widgets/donut_chart_story.dart';
import 'package:tc3_flutter_app/shared/design_system/storybook/stories/features/home/widgets/weekly_cashflow_chart_story.dart';

import 'monthly_summary_story.dart';

final List<Story> homeWidgetsStories = [
  monthlySummaryStory,
  donutChartStory,
  weeklyCashflowStory,
  ...balanceCardStory,
];