import 'package:storybook_flutter/storybook_flutter.dart';
import '../../../../previews/features/home/widgets/weekly_cashflow_chart_preview.dart';

final Story weeklyCashflowStory = Story(
  name: 'Widgets/Home/Weekly Cashflow Chart',
  description: 'Gráfico acumulativo com diferentes tendências de mercado.',
  builder: (context) {
    /// Knob para estado vazio
    final hasData = context.knobs.boolean(label: 'Possui dados?', initial: true);
    
    /// Knob para trocar a tendência (Alta, Baixa, Estável)
    final trend = context.knobs.options(
      label: 'Comportamento da Semana',
      initial: 'Alta',
      options: [
        const Option(label: 'Alta (Lucro Acumulado)', value: 'Alta'),
        const Option(label: 'Baixa (Gastos Excessivos)', value: 'Baixa'),
        const Option(label: 'Estável (Equilibrado)', value: 'Estavel'),
      ],
    );

    Map<int, double> mockData = {};

    if (hasData) {
      switch (trend) {
        case 'Alta':
          /// Valores positivos que fazem o saldo subir
          mockData = {1: 1500, 2: 300, 3: 450, 4: -100, 5: 800, 6: 200, 7: 600};
          break;
        case 'Baixa':
          /// Valores negativos altos que puxam o saldo para baixo
          mockData = {1: 2000, 2: -800, 3: -400, 4: -900, 5: 100, 6: -600, 7: -300};
          break;
        case 'Estavel':
          /// Pequenas variações que mantêm a linha quase reta
          mockData = {1: 1000, 2: 50, 3: -40, 4: 10, 5: -20, 6: 60, 7: -30};
          break;
      }
    }

    return WeeklyCashflowChartPreview(
      data: mockData,
    );
  },
);