import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tc3_flutter_app/shared/design_system/storybook/previews/features/home/widgets/balance_card_preview.dart';

final List<Story> balanceCardStory = [
  Story(
    name: 'Widgets/Home/Balance Card',
    description: 'Card que exibe o saldo atual do usuário.',
    builder: (context) {
      final balance = context.knobs.slider(
        label: 'Saldo',
        min: -5000,
        max: 10000,
        initial: 2450.75,
      );

      return BalanceCardPreview(balance: balance);
    },
  ),
];