import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../../components/app_section_title.dart';

final List<Story> appSectionTitleStories = [
  Story(
    name: 'Components/AppSectionTitle',
    description: 'Título de seção com subtítulo opcional.',
    builder: (context) {
      final title = context.knobs.text(
        label: 'Title',
        initial: 'Transações recentes',
      );

      final showSubtitle = context.knobs.boolean(
        label: 'Show subtitle',
        initial: true,
      );

      final subtitle = context.knobs.text(
        label: 'Subtitle',
        initial: 'Acompanhe suas movimentações mais recentes.',
      );

      return Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 360),
          child: AppSectionTitle(
            title: title,
            subtitle: showSubtitle ? subtitle : null,
          ),
        ),
      );
    },
  ),
];