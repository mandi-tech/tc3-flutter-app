import 'package:flutter/material.dart';

import '../../../../../shared/design_system/components/app_text_field.dart';

class TransactionSearchField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const TransactionSearchField({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      label: 'Buscar',
      hintText: 'Ex: mercado, salário, uber...',
      controller: controller,
      onChanged: onChanged,
      prefixIcon: const Icon(Icons.search),
    );
  }
}