import 'package:flutter/material.dart';

import '../../../../shared/design_system/components/app_dropdown_field.dart';

class CategoryDropdown extends StatelessWidget {
  final String label;
  final List<String> categories;
  final String? selectedCategory;
  final ValueChanged<String?> onChanged;

  const CategoryDropdown({
    super.key,
    required this.label,
    required this.categories,
    required this.selectedCategory,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AppDropdownField<String>(
      label: label,
      value: selectedCategory,
      items: categories
          .map(
            (category) => DropdownMenuItem<String>(
              value: category,
              child: Text(category),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }
}