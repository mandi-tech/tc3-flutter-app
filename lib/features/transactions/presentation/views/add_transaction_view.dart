import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../shared/design_system/tokens/app_spacing.dart';
import '../controllers/transaction_controller.dart';
import '../../domain/enums/transaction_type.dart';
import '../controllers/add_transaction_controller.dart';
import '../widgets/add_transaction_form.dart';
import '../widgets/add_transaction_header.dart';

class AddTransactionView extends StatefulWidget {
  final TransactionType initialType;

  const AddTransactionView({
    super.key,
    required this.initialType,
  });

  @override
  State<AddTransactionView> createState() => _AddTransactionViewState();
}

class _AddTransactionViewState extends State<AddTransactionView> {
  late final AddTransactionController _controller;

  @override
void initState() {
  super.initState();

  _controller = AddTransactionController(
    initialType: widget.initialType,
  );
}

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _controller.selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
      locale: const Locale('pt', 'BR'),
    );

    if (pickedDate != null) {
      _controller.setDate(pickedDate);
    }
  }

  Future<void> _saveTransaction() async {
    if (!_controller.validateForm()) return;

    final amount = _controller.parseAmount();

    if (amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Informe um valor válido')),
      );
      return;
    }

    try {
      await context.read<TransactionController>().addTransaction(
            type: _controller.type,
            description: _controller.descriptionController.text.trim(),
            category: _controller.selectedCategory!,
            amount: amount,
            date: _controller.selectedDate,
            receiptImage: _controller.receiptImage,
          );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Transação adicionada com sucesso')),
      );

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao salvar: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _controller,
      builder: (context, _) {
        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              children: [
                AddTransactionHeader(
                  type: _controller.type,
                ),
                const SizedBox(height: AppSpacing.lg),
                AddTransactionForm(
                  formKey: _controller.formKey,
                  descriptionController: _controller.descriptionController,
                  amountController: _controller.amountController,
                  selectedCategory: _controller.selectedCategory,
                  selectedDate: _controller.selectedDate,
                  receiptImage: _controller.receiptImage,
                  isSaving: _controller.isSaving,
                  categories: _controller.currentCategories,
                  onCategoryChanged: _controller.setCategory,
                  onPickDate: _pickDate,
                  onPickFromGallery: _controller.pickFromGallery,
                  onPickFromCamera: _controller.pickFromCamera,
                  onRemoveImage: _controller.removeImage,
                  onSave: _saveTransaction,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}