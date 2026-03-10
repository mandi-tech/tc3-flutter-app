import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../shared/design_system/tokens/app_spacing.dart';
import '../../../transactions/presentation/controllers/transaction_controller.dart';
import '../controllers/add_transaction_controller.dart';
import '../widgets/add_transaction_form.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  late final AddTransactionController _formController;

  @override
  void initState() {
    super.initState();
    _formController = AddTransactionController();
  }

  @override
  void dispose() {
    _formController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _formController.selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
      locale: const Locale('pt', 'BR'),
    );

    if (pickedDate != null) {
      _formController.setDate(pickedDate);
    }
  }

  Future<void> _saveTransaction() async {
    if (_formController.isSaving) return;
    if (!_formController.validateForm()) return;

    final amount = _formController.parseAmount();

    if (amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Informe um valor válido.'),
        ),
      );
      return;
    }

    _formController.startSaving();

    try {
      await context.read<TransactionController>().addTransaction(
            type: _formController.type,
            description: _formController.descriptionController.text.trim(),
            category: _formController.selectedCategory!,
            amount: amount,
            date: _formController.selectedDate,
            receiptImage: _formController.receiptImage,
          );

      if (!mounted) return;

      _formController.finishSuccessState();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Transação adicionada com sucesso.'),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      _formController.finishErrorState();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao salvar transação: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _formController,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Nova transação'),
            centerTitle: true,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: AddTransactionForm(
                formKey: _formController.formKey,
                descriptionController: _formController.descriptionController,
                amountController: _formController.amountController,
                type: _formController.type,
                selectedCategory: _formController.selectedCategory,
                selectedDate: _formController.selectedDate,
                receiptImage: _formController.receiptImage,
                isSaving: _formController.isSaving,
                categories: _formController.currentCategories,
                onTypeChanged: _formController.setType,
                onCategoryChanged: _formController.setCategory,
                onPickDate: _pickDate,
                onPickFromGallery: _formController.pickFromGallery,
                onPickFromCamera: _formController.pickFromCamera,
                onRemoveImage: _formController.removeImage,
                onSave: _saveTransaction,
              ),
            ),
          ),
        );
      },
    );
  }
}