import 'package:storybook_flutter/storybook_flutter.dart';

import '../support/states/component_state_stories.dart';
import '../support/states/state_stories.dart';
import 'components_stories.dart';
import 'screen_stories.dart';
import 'tokens/token_stories.dart';
import 'widget_stories.dart';

final List<Story> allStories = [
  /// Telas
  ...screenStories,

  /// Componentes isolados (Widgets)
  ...widgetStories,
  
  /// Design System (Tokens)
  ...tokenStories,

  /// Componentes compostos (Screens, Forms, etc.)
  ...componentStories,
  ...componentStateStories,

  /// Estados de telas e componentes
  ...stateStories,
];