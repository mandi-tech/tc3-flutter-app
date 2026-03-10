import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../shared/design_system/components/app_button.dart';
import '../../../../shared/design_system/components/app_text_field.dart';
import '../../../../shared/design_system/tokens/app_spacing.dart';
import 'category_dropdown.dart';
import 'receipt_image_picker.dart';
import 'transaction_date_field.dart';
import 'transaction_type_selector.dart';

class AddTransactionForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController descriptionController;
  final TextEditingController amountController;
  final String type;
  final String? selectedCategory;
  final DateTime selectedDate;
  final XFile? receiptImage;
  final bool isSaving;
  final List<String> categories;
  final ValueChanged<String> onTypeChanged;
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
    required this.type,
    required this.selectedCategory,
    required this.selectedDate,
    required this.receiptImage,
    required this.isSaving,
    required this.categories,
    required this.onTypeChanged,
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
          TransactionTypeSelector(
            selectedType: type,
            onChanged: onTypeChanged,
          ),
          const SizedBox(height: AppSpacing.md),
          AppTextField(
            label: 'Descrição',
            hintText: 'Ex: Mercado, salário, Uber...',
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
            hintText: 'Ex: 120,50',
            controller: amountController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Informe o valor';
              }
              return null;
            },
          ),
          const SizedBox(height: AppSpacing.md),
          CategoryDropdown(
            label: 'Categoria',
            categories: categories,
            selectedCategory: selectedCategory,
            onChanged: onCategoryChanged,
          ),
          const SizedBox(height: AppSpacing.md),
          TransactionDateField(
            selectedDate: selectedDate,
            onTap: onPickDate,
          ),
          const SizedBox(height: AppSpacing.md),
          ReceiptImagePicker(
            image: receiptImage,
            onPickFromGallery: onPickFromGallery,
            onTakePhoto: onPickFromCamera,
            onRemove: onRemoveImage,
          ),
          const SizedBox(height: AppSpacing.lg),
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