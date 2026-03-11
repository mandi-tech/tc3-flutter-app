import 'package:flutter/material.dart';

import '../../../../../shared/design_system/components/app_dropdown_field.dart';

class TransactionCategoryDropdown extends StatelessWidget {
  final String? selectedCategory;
  final List<String> categories;
  final ValueChanged<String?> onChanged;

  const TransactionCategoryDropdown({
    super.key,
    required this.selectedCategory,
    required this.categories,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AppDropdownField<String>(
      label: 'Categoria',
      value: selectedCategory,
      items: [
        const DropdownMenuItem<String>(
          value: null,
          child: Text('Todas as categorias'),
        ),
        ...categories.map(
          (category) => DropdownMenuItem<String>(
            value: category,
            child: Text(category),
          ),
        ),
      ],
      onChanged: onChanged,
    );
  }
}