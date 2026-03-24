import 'package:image_picker/image_picker.dart';

import '../../data/services/transaction_service.dart';
import '../enums/transaction_type.dart';

class AddTransactionUsecase {
  final TransactionService service;

  AddTransactionUsecase(this.service);

  Future<void> call({
    required TransactionType type,
    required String description,
    required String category,
    required double amount,
    required DateTime date,
    XFile? receiptImage,
  }) {
    return service.addTransaction(
      type: type,
      description: description,
      category: category,
      amount: amount,
      date: date,
      receiptImage: receiptImage,
    );
  }
}