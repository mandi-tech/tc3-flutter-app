import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../shared/design_system/components/app_tob_bar.dart';
import '../../../../shared/design_system/tokens/app_spacing.dart';
import '../../domain/enums/transaction_type.dart';
import '../controllers/add_transaction_controller.dart';
import '../controllers/transaction_controller.dart';
import '../widgets/add_transaction_form.dart';
import '../widgets/add_transaction_header.dart';

class AddTransactionScreen extends StatefulWidget {
  final TransactionType initialType;

  const AddTransactionScreen({
    super.key,
    required this.initialType,
  });

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
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
    // 1. Validação básica antes de começar
    if (!_controller.validateForm()) return;

    final amount = _controller.parseAmount();
    if (amount == null || amount <= 0) {
      _showSnackBar('Informe um valor válido', isError: true);
      return;
    }

    try {
      // 2. Inicia o estado de carregamento
      _controller.setSaving(true);

      // 3. Chamada para o controller de transações (ex: Firebase ou Banco Local)
      await context.read<TransactionController>().addTransaction(
            type: _controller.type,
            description: _controller.descriptionController.text.trim(),
            category: _controller.selectedCategory!,
            amount: amount,
            date: _controller.selectedDate,
            receiptImage: _controller.receiptImage,
          );

      // 4. Se chegou aqui, deu certo!
      if (!mounted) return;
      
      _showSnackBar('Transação adicionada com sucesso!');
      
      // 5. Limpa os campos para a próxima entrada
      _controller.resetForm();

    } catch (e) {
      // 6. Caso ocorra erro na gravação
      if (mounted) {
        _showSnackBar('Erro ao salvar: $e', isError: true);
      }
    } finally {
      // 7. O PONTO CHAVE: Garante que o loading pare SEMPRE
      if (mounted) {
        _controller.setSaving(false);
      }
    }
  }

  void _showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(
        title: 'Nova transação',
        showBackButton: true,
      ),
      body: ListenableBuilder(
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
      ),
    );
  }
}