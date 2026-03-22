import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tc3_flutter_app/shared/design_system/storybook/support/states/components/app_fields_states_story.dart';
import 'package:tc3_flutter_app/shared/design_system/storybook/support/states/features/navigation/main_navigation_bar_states_story.dart';

import 'features/transactions/transaction_empty_state_story.dart';


final List<Story> stateStories = [
  ...transactionEmptyStateStories,
  appFieldsStatesStory,
  mainNavigationBarStatesStory
];
