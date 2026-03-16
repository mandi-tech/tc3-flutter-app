import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../shared/design_system/components/app_button.dart';
import '../../../../shared/design_system/components/app_text_field.dart';
import '../../../../shared/design_system/tokens/app_spacing.dart';
import '../../../../shared/utils/currency_input_formatter.dart';
import 'category_grid.dart';
import 'receipt_image_picker.dart';
import 'transaction_date_field.dart';

class AddTransactionForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController descriptionController;
  final TextEditingController amountController;

  final String? selectedCategory;
  final DateTime selectedDate;
  final XFile? receiptImage;

  final bool isSaving;

  final List<String> categories;

  final ValueChanged<String?> onCategoryChanged;

  final VoidCallback onPickDate;
  final Future<void> Function() onPickFromGallery;
  final Future<void> Function() onPickFromCamera;
  final VoidCallback onRemoveImage;

  final VoidCallback onSave;

  const AddTransactionForm({
    super.key,
    required this.formKey,
    required this.descriptionController,
    required this.amountController,
    required this.selectedCategory,
    required this.selectedDate,
    required this.receiptImage,
    required this.isSaving,
    required this.categories,
    required this.onCategoryChanged,
    required this.onPickDate,
    required this.onPickFromGallery,
    required this.onPickFromCamera,
    required this.onRemoveImage,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTextField(
            label: 'Descrição',
            hintText: 'Ex: Mercado, Uber...',
            controller: descriptionController,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Informe a descrição';
              }
              return null;
            },
          ),

          const SizedBox(height: AppSpacing.md),

          AppTextField(
            label: 'Valor',
            hintText: 'R\$ 0,00',
            controller: amountController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.end, 
            inputFormatters: [
              CurrencyInputFormatter(),
            ],
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Informe o valor';
              }
              return null;
            },
          ),

          const SizedBox(height: AppSpacing.lg),

          const Text(
            'Categoria',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: AppSpacing.sm),

          CategoryGrid(
            categories: categories,
            selectedCategory: selectedCategory,
            onSelected: (category) => onCategoryChanged(category),
          ),

          const SizedBox(height: AppSpacing.lg),

          TransactionDateField(
            selectedDate: selectedDate,
            onTap: onPickDate,
          ),

          const SizedBox(height: AppSpacing.lg),

          ReceiptImagePicker(
            image: receiptImage,
            onPickFromGallery: onPickFromGallery,
            onTakePhoto: onPickFromCamera,
            onRemove: onRemoveImage,
          ),

          const SizedBox(height: AppSpacing.xl),

          AppButton(
            label: 'Salvar transação',
            onPressed: onSave,
            isLoading: isSaving,
          ),
        ],
      ),
    );
  }
}