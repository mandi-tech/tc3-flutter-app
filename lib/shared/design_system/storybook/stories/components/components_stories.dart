import 'package:storybook_flutter/storybook_flutter.dart';

import 'app_button_story.dart';
import 'app_card_story.dart';
import 'app_dropdown_field_story.dart';
import 'app_email_field_story.dart';
import 'app_password_field_story.dart';
import 'app_picker_field_story.dart';
import 'app_section_title_story.dart';
import 'app_text_field_story.dart';
import '../navigation/main_navigation_bar_story.dart';

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
];