import 'package:storybook_flutter/storybook_flutter.dart';
import '../../../../previews/features/home/widgets/monthly_summary_preview.dart';

final Story monthlySummaryStory = Story(
  name: 'Widgets/Home/Monthly Summary',
  description: 'Cards de resumo financeiro centralizados.',
  builder: (context) {
    // Knobs para você alterar os valores no painel lateral do Storybook
    final income = context.knobs.text(
      label: 'Receitas', 
      initial: 'R\$ 15.000,00',
    );
    final expense = context.knobs.text(
      label: 'Despesas', 
      initial: 'R\$ 3.250,00',
    );

    return MonthlySummaryPreview(
      income: income,
      expense: expense,
    );
  },
);