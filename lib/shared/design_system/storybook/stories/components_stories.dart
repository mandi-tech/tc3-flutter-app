import 'package:storybook_flutter/storybook_flutter.dart';

import 'components/app_button_story.dart';
import 'components/app_card_story.dart';
import 'components/app_dropdown_field_story.dart';
import 'components/app_email_field_story.dart';
import 'components/app_password_field_story.dart';
import 'components/app_picker_field_story.dart';
import 'components/app_section_title_story.dart';
import 'components/app_text_field_story.dart';
import 'components/app_top_bar_story.dart';
import 'features/navigation/widgets/main_navigation_bar_story.dart';

final List<Story> componentStories = [
  ...appButtonStories,
  ...appTextFieldStories,
  ...appEmailFieldStories,
  ...appPasswordFieldStories,
  ...appCardStories,
  ...appDropdownFieldStories,
  ...appPickerFieldStories,
  ...appSectionTitleStories,
  ...mainNavigationBarStories,
  ...appTopBarStories,
];