import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/enums/transaction_type.dart';
import '../helpers/transaction_categories.dart';

class AddTransactionController extends ChangeNotifier {
  AddTransactionController({
    TransactionType initialType = TransactionType.expense,
  }) : _type = initialType {
    _selectedCategory = currentCategories.first;
  }

  final formKey = GlobalKey<FormState>();

  final descriptionController = TextEditingController();
  final amountController = TextEditingController();
  final imagePicker = ImagePicker();

  TransactionType _type;
  String? _selectedCategory;
  DateTime _selectedDate = DateTime.now();
  XFile? _receiptImage;
  bool _isSaving = false;

  /// Getters
  TransactionType get type => _type;
  String? get selectedCategory => _selectedCategory;
  DateTime get selectedDate => _selectedDate;
  XFile? get receiptImage => _receiptImage;
  bool get isSaving => _isSaving;

  List<String> get currentCategories {
    return _type == TransactionType.income
        ? TransactionCategories.income
        : TransactionCategories.expense;
  }

  /// Setters com Notificação
  void setType(TransactionType value) {
    if (_type == value) return;
    _type = value;
    _selectedCategory = currentCategories.isNotEmpty ? currentCategories.first : null;
    notifyListeners();
  }

  void setCategory(String? value) {
    _selectedCategory = value;
    notifyListeners();
  }

  void setDate(DateTime value) {
    _selectedDate = value;
    notifyListeners();
  }

  void setSaving(bool value) {
    _isSaving = value;
    notifyListeners();
  }

  /// Imagens
  Future<void> pickFromGallery() async {
    final image = await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (image != null) {
      _receiptImage = image;
      notifyListeners();
    }
  }

  Future<void> pickFromCamera() async {
    final image = await imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );
    if (image != null) {
      _receiptImage = image;
      notifyListeners();
    }
  }

  void removeImage() {
    _receiptImage = null;
    notifyListeners();
  }

  /// Lógica de Negócio
  double? parseAmount() {
    if (amountController.text.isEmpty) return null;
    
    final normalized = amountController.text
        .trim()
        .replaceAll('R\$', '')
        .replaceAll(RegExp(r'\s+'), '')
        .replaceAll('.', '')
        .replaceAll(',', '.');

    return double.tryParse(normalized);
  }

  bool validateForm() {
    return (formKey.currentState?.validate() ?? false) && _selectedCategory != null;
  }

  /// Limpa todos os campos e estados para uma nova entrada
  void resetForm() {
    _isSaving = false;
    descriptionController.clear();
    amountController.clear();
    _receiptImage = null;
    _selectedDate = DateTime.now();
    
    /// Mantém o tipo atual mas volta para a primeira categoria
    _selectedCategory = currentCategories.isNotEmpty ? currentCategories.first : null;
    
    /// Limpa as mensagens de erro visuais do Form (se houver)
    formKey.currentState?.reset();
    
    notifyListeners();
  }

  @override
  void dispose() {
    descriptionController.dispose();
    amountController.dispose();
    super.dispose();
  }
}