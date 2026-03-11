import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../../components/app_card.dart';

final List<Story> appCardStories = [
  Story(
    name: 'Components/AppCard',
    description: 'Card base do Design System.',
    builder: (context) {
      final tappable = context.knobs.boolean(
        label: 'Tappable',
        initial: false,
      );

      final withLongContent = context.knobs.boolean(
        label: 'Long content',
        initial: false,
      );

      return Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 360),
          child: AppCard(
            onTap: tappable ? () {} : null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Resumo financeiro',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  withLongContent
                      ? 'Este é um conteúdo maior para validar espaçamento, borda, padding e comportamento visual do card em cenários com mais texto.'
                      : 'Saldo disponível: R\$ 2.450,75',
                ),
              ],
            ),
          ),
        ),
      );
    },
  ),
];