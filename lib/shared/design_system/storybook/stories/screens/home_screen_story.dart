import 'package:storybook_flutter/storybook_flutter.dart';
import 'previews/home_screen_preview.dart';

final Story homeScreenStory = Story(
  name: 'Screens/Home Screen',
  description: 'Visão completa da Dashboard com dados mockados.',
  builder: (context) {
    /// Knobs para controle em tempo real
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

    return HomeScreenPreview(
      balance: balance,
      income: income,
      expense: expense,
    );
  },
);