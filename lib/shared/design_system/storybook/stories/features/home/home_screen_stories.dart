import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../../../tokens/app_spacing.dart';
import '../../widgets/story_preview_frame.dart';
import '../../../previews/features/home/home_screen_preview.dart';

final List<Story> homeScreenStories = [
  // 1. Story Individual com Knobs
  Story(
    name: 'Screens/Home',
    description: 'Visão completa da Dashboard com dados mockados.',
    builder: (context) {
      final balance = context.knobs.slider(
        label: 'Saldo em conta',
        initial: 2450.00,
        min: -1000,
        max: 10000,
      );

      final income = context.knobs.text(
        label: 'Resumo: Receitas',
        initial: 'R\$ 4.200,00',
      );

      final expense = context.knobs.text(
        label: 'Resumo: Despesas',
        initial: 'R\$ 1.750,00',
      );

      return StoryPreviewFrame(
        width: 390,
        title: 'Home Screen',
        child: HomeScreenPreview(
          balance: balance,
          income: income,
          expense: expense,
        ),
      );
    },
  ),

  // 2. Story Responsivo
  Story(
    name: 'Screens/Responsive/Home Responsive',
    builder: (context) => SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          children: [
            StoryPreviewFrame(
              key: const Key('home_small'),
              width: 320,
              title: 'Mobile Small',
              child: const HomeScreenPreview(
                balance: 0.0,
                income: '',
                expense: '',
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            StoryPreviewFrame(
              key: const Key('home_large'),
              width: 390,
              title: 'Mobile Large',
              child: const HomeScreenPreview(
                balance: 0.0,
                income: '',
                expense: '',
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            StoryPreviewFrame(
              key: const Key('home_tablet'),
              width: 600,
              title: 'Tablet',
              child: const HomeScreenPreview(
                balance: 0.0,
                income: '',
                expense: '',
              ),
            ),
          ],
        ),
      ),
    ),
  ),
];