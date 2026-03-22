import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../shared/design_system/components/app_button.dart';
import '../../../../shared/design_system/tokens/app_spacing.dart';
import '../../data/models/transaction_model.dart';
import '../../domain/enums/transaction_type.dart';
import '../controllers/transaction_controller.dart';

// Classe de apoio para as categorias
abstract final class TransactionCategories {
  static const income = ["Salário", "Freelance", "Investimentos", "Presente", "Reembolso", "Outros"];
  static const expense = ["Alimentação", "Transporte", "Moradia", "Lazer", "Saúde", "Compras", "Educação", "Assinaturas", "Outros"];
}

void showTransactionDetails(BuildContext context, TransactionModel transaction) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => TransactionDetailsModal(transaction: transaction),
  );
}

class TransactionDetailsModal extends StatefulWidget {
  final TransactionModel transaction;
  const TransactionDetailsModal({super.key, required this.transaction});

  @override
  State<TransactionDetailsModal> createState() => _TransactionDetailsModalState();
}

class _TransactionDetailsModalState extends State<TransactionDetailsModal> {
  bool _isEditing = false;
  bool _isUpdating = false;
  
  XFile? _newImage;
  Uint8List? _webImagePreview;

  late TextEditingController _descriptionController;
  late TextEditingController _amountController;
  late DateTime _selectedDate;
  late String _selectedCategory;

  @override
  void initState() {
    super.initState();
    _descriptionController = TextEditingController(text: widget.transaction.description);
    _amountController = TextEditingController(text: widget.transaction.amount.toString());
    _selectedDate = widget.transaction.date;
    _selectedCategory = widget.transaction.category;
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _newImage = pickedFile;
        _webImagePreview = bytes;
      });
    }
  }

  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }

  void _resetFields() {
    setState(() {
      _isEditing = false;
      _newImage = null;
      _webImagePreview = null;
      _descriptionController.text = widget.transaction.description;
      _amountController.text = widget.transaction.amount.toString();
      _selectedDate = widget.transaction.date;
      _selectedCategory = widget.transaction.category;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isIncome = widget.transaction.type == TransactionType.income;
    final categories = isIncome ? TransactionCategories.income : TransactionCategories.expense;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.only(
        top: AppSpacing.lg,
        left: AppSpacing.lg,
        right: AppSpacing.lg,
        bottom: MediaQuery.of(context).viewInsets.bottom + AppSpacing.lg,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Dinâmico
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _isEditing ? "Editar Transação" : "Detalhes",
                  style: TextStyle(
                    fontSize: 20, 
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                Row(
                  children: [
                    if (!_isEditing)
                      IconButton(
                        icon: Icon(Icons.edit_note, color: colorScheme.primary, size: 28),
                        onPressed: () => setState(() => _isEditing = true),
                      ),
                    IconButton(
                      icon: Icon(Icons.close, color: colorScheme.onSurface),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ],
            ),
            Divider(color: colorScheme.outlineVariant),
            const SizedBox(height: AppSpacing.md),

            // Área da Imagem com Cores do Tema
            GestureDetector(
              onTap: _isEditing ? _pickImage : null,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: colorScheme.outlineVariant),
                      image: _webImagePreview != null
                          ? DecorationImage(image: MemoryImage(_webImagePreview!), fit: BoxFit.cover)
                          : (widget.transaction.receiptImageUrl != null
                              ? DecorationImage(image: NetworkImage(widget.transaction.receiptImageUrl!), fit: BoxFit.cover)
                              : null),
                    ),
                    child: widget.transaction.receiptImageUrl == null && _newImage == null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.image_not_supported_outlined, size: 40, color: colorScheme.onSurfaceVariant),
                              Text("Sem comprovante", style: TextStyle(color: colorScheme.onSurfaceVariant)),
                            ],
                          )
                        : null,
                  ),
                  if (_isEditing)
                    Container(
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: colorScheme.scrim.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(Icons.camera_alt_outlined, color: Colors.white, size: 40),
                    ),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.lg),

            // Campos de Edição ou Visualização
            if (_isEditing) ...[
              TextFormField(
                controller: _descriptionController,
                style: TextStyle(color: colorScheme.onSurface),
                decoration: const InputDecoration(labelText: "Descrição", border: OutlineInputBorder(), prefixIcon: Icon(Icons.description_outlined)),
              ),
              const SizedBox(height: AppSpacing.md),
              TextFormField(
                controller: _amountController,
                style: TextStyle(color: colorScheme.onSurface),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(labelText: "Valor (R\$)", border: OutlineInputBorder(), prefixIcon: Icon(Icons.attach_money)),
              ),
              const SizedBox(height: AppSpacing.md),
              DropdownButtonFormField<String>(
                value: categories.contains(_selectedCategory) ? _selectedCategory : categories.first,
                dropdownColor: colorScheme.surface,
                style: TextStyle(color: colorScheme.onSurface),
                decoration: const InputDecoration(labelText: "Categoria", border: OutlineInputBorder(), prefixIcon: Icon(Icons.category_outlined)),
                items: categories.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
                onChanged: (val) => setState(() => _selectedCategory = val!),
              ),
              const SizedBox(height: AppSpacing.md),
              InkWell(
                onTap: _selectDate,
                child: InputDecorator(
                  decoration: const InputDecoration(labelText: "Data", border: OutlineInputBorder(), prefixIcon: Icon(Icons.calendar_today_outlined)),
                  child: Text(DateFormat('dd/MM/yyyy').format(_selectedDate), style: TextStyle(color: colorScheme.onSurface)),
                ),
              ),
            ] else ...[
              _buildDetailTile(context, Icons.description_outlined, "Descrição", widget.transaction.description),
              _buildDetailTile(context, Icons.payments_outlined, "Valor", "R\$ ${widget.transaction.amount.toStringAsFixed(2)}"),
              _buildDetailTile(context, Icons.category_outlined, "Categoria", widget.transaction.category),
              _buildDetailTile(context, Icons.calendar_today_outlined, "Data", DateFormat('dd/MM/yyyy').format(widget.transaction.date)),
            ],

            const SizedBox(height: AppSpacing.xl),

            // Botões usando seu AppButton
            if (_isEditing) ...[
              SizedBox(
                width: double.infinity,
                child: AppButton(
                  label: "Confirmar Alterações",
                  isLoading: _isUpdating,
                  variant: AppButtonVariant.primary,
                  onPressed: () async {
                    setState(() => _isUpdating = true);
                    try {
                      await context.read<TransactionController>().updateTransaction(
                        id: widget.transaction.id,
                        description: _descriptionController.text,
                        amount: double.tryParse(_amountController.text) ?? 0.0,
                        category: _selectedCategory,
                        date: _selectedDate,
                        type: widget.transaction.type,
                        newReceiptImage: _newImage,
                        currentImageUrl: widget.transaction.receiptImageUrl,
                      );
                      if (mounted) Navigator.pop(context);
                    } catch (e) {
                      setState(() => _isUpdating = false);
                    }
                  },
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              SizedBox(
                width: double.infinity,
                child: AppButton(
                  label: "Cancelar",
                  variant: AppButtonVariant.secondary,
                  enabled: !_isUpdating,
                  onPressed: _resetFields,
                ),
              ),
            ],
            const SizedBox(height: AppSpacing.md),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailTile(BuildContext context, IconData icon, String title, String subtitle) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: colorScheme.primary.withOpacity(0.1), 
        child: Icon(icon, color: colorScheme.primary, size: 20)
      ),
      title: Text(title, style: TextStyle(fontSize: 12, color: colorScheme.onSurfaceVariant)),
      subtitle: Text(subtitle, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: colorScheme.onSurface)),
    );
  }
}