import 'package:storybook_flutter/storybook_flutter.dart';

import 'colors_story.dart';
import 'typography_story.dart';
import 'spacing_story.dart';

final List<Story> tokenStories = [
  Story(
    name: 'Tokens/Colors',
    description: 'Paleta do Design System.',
    builder: (_) => const ColorsStory(),
  ),
  Story(
    name: 'Tokens/Typography',
    description: 'Estilos tipográficos do Design System.',
    builder: (_) => const TypographyStory(),
  ),
  Story(
    name: 'Tokens/Spacing',
    description: 'Escala de espaçamento do Design System.',
    builder: (_) => const SpacingStory(),
  ),
];