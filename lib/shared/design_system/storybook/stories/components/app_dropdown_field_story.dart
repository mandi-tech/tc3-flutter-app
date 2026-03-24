import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../../components/app_dropdown_field.dart';

class _AppDropdownFieldStoryWrapper extends StatefulWidget {
  const _AppDropdownFieldStoryWrapper();

  @override
  State<_AppDropdownFieldStoryWrapper> createState() =>
      _AppDropdownFieldStoryWrapperState();
}

class _AppDropdownFieldStoryWrapperState
    extends State<_AppDropdownFieldStoryWrapper> {
  String? selectedValue = 'Alimentação';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 360),
        child: AppDropdownField<String>(
          label: 'Categoria',
          value: selectedValue,
          items: const [
            DropdownMenuItem(
              value: 'Alimentação',
              child: Text('Alimentação'),
            ),
            DropdownMenuItem(
              value: 'Transporte',
              child: Text('Transporte'),
            ),
            DropdownMenuItem(
              value: 'Moradia',
              child: Text('Moradia'),
            ),
            DropdownMenuItem(
              value: 'Saúde',
              child: Text('Saúde'),
            ),
          ],
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
          },
        ),
      ),
    );
  }
}

final List<Story> appDropdownFieldStories = [
  Story(
    name: 'Components/AppDropdownField',
    description: 'Dropdown base do Design System.',
    builder: (_) => const _AppDropdownFieldStoryWrapper(),
  ),
];