import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../helpers/transaction_categories.dart';

class AddTransactionController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final descriptionController = TextEditingController();
  final amountController = TextEditingController();
  final imagePicker = ImagePicker();

  String type = 'expense';
  String? selectedCategory = TransactionCategories.expense.first;
  DateTime selectedDate = DateTime.now();
  XFile? receiptImage;
  bool isSaving = false;

  List<String> get currentCategories {
    return type == 'income'
        ? TransactionCategories.income
        : TransactionCategories.expense;
  }

  void setType(String value) {
    type = value;
    selectedCategory = currentCategories.first;
    notifyListeners();
  }

  void setCategory(String? value) {
    selectedCategory = value;
    notifyListeners();
  }

  void setDate(DateTime value) {
    selectedDate = value;
    notifyListeners();
  }

  Future<void> pickFromGallery() async {
    final image = await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      receiptImage = image;
      notifyListeners();
    }
  }

  Future<void> pickFromCamera() async {
    final image = await imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );

    if (image != null) {
      receiptImage = image;
      notifyListeners();
    }
  }

  void removeImage() {
    receiptImage = null;
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
    return isValid && selectedCategory != null;
  }

  void startSaving() {
    isSaving = true;
    notifyListeners();
  }

  void finishSuccessState() {
    isSaving = false;
    descriptionController.clear();
    amountController.clear();
    type = 'expense';
    selectedCategory = TransactionCategories.expense.first;
    selectedDate = DateTime.now();
    receiptImage = null;
    notifyListeners();
  }

  void finishErrorState() {
    isSaving = false;
    notifyListeners();
  }

  @override
  void dispose() {
    descriptionController.dispose();
    amountController.dispose();
    super.dispose();
  }
}