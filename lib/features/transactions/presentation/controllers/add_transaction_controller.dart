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

  TransactionType get type => _type;
  String? get selectedCategory => _selectedCategory;
  DateTime get selectedDate => _selectedDate;
  XFile? get receiptImage => _receiptImage;
  bool get isSaving => _isSaving;

  List<String> get currentCategories {
    return _type.isIncome
        ? TransactionCategories.income
        : TransactionCategories.expense;
  }

  void setType(TransactionType value) {
    _type = value;
    _selectedCategory = currentCategories.first;
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

  double? parseAmount() {
    final normalized = amountController.text
        .trim()
        .replaceAll('R\$', '')
        .replaceAll(' ', '')
        .replaceAll('.', '')
        .replaceAll(',', '.');

    return double.tryParse(normalized);
  }

  bool validateForm() {
    final isValid = formKey.currentState?.validate() ?? false;
    return isValid && _selectedCategory != null;
  }

  void startSaving() {
    _isSaving = true;
    notifyListeners();
  }

  void finishSuccessState() {
    _isSaving = false;
    descriptionController.clear();
    amountController.clear();
    _type = TransactionType.expense;
    _selectedCategory = TransactionCategories.expense.first;
    _selectedDate = DateTime.now();
    _receiptImage = null;
    notifyListeners();
  }

  void finishErrorState() {
    _isSaving = false;
    notifyListeners();
  }

  @override
  void dispose() {
    descriptionController.dispose();
    amountController.dispose();
    super.dispose();
  }
}