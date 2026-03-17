import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../shared/design_system/components/app_picker_field.dart';

class TransactionDateField extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback onTap;

  const TransactionDateField({
    super.key,
    required this.selectedDate,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppPickerField(
      label: 'Data',
      value: DateFormat('dd/MM/yyyy').format(selectedDate),
      onTap: onTap,
      suffixIcon: const Icon(Icons.calendar_today_outlined),
    );
  }
}