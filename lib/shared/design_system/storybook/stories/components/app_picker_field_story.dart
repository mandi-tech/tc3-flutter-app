import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../../components/app_picker_field.dart';

final List<Story> appPickerFieldStories = [
  Story(
    name: 'Components/AppPickerField',
    description: 'Campo visual para seleção com clique, como data ou período.',
    builder: (context) {
      final label = context.knobs.text(
        label: 'Label',
        initial: 'Data',
      );

      final value = context.knobs.text(
        label: 'Value',
        initial: '10/03/2026',
      );

      return Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 360),
          child: AppPickerField(
            label: label,
            value: value,
            onTap: () {},
            suffixIcon: const Icon(Icons.calendar_today_outlined),
          ),
        ),
      );
    },
  ),
];