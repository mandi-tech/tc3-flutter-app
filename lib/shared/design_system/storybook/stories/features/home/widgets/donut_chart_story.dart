import 'package:storybook_flutter/storybook_flutter.dart';
import '../../../../previews/features/home/widgets/donut_chart_preview.dart';

final Story donutChartStory = Story(
  name: 'Components/Charts/Expenses Donut',
  description: 'Gráfico de rosca para despesas por categoria.',
  builder: (context) {
    // Knob para alternar entre estados
    final hasData = context.knobs.boolean(label: 'Possui dados?', initial: true);
    
    final mockData = {
      'Alimentação': 1200.0,
      'Transporte': 450.0,
      'Lazer': 300.0,
      'Saúde': 600.0,
      'Educação': 850.0,
    };

    return DonutChartPreview(
      data: hasData ? mockData : {},
    );
  },
);