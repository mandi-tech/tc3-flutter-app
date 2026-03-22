import 'package:image_picker/image_picker.dart';
import '../../data/services/transaction_service.dart';
import '../enums/transaction_type.dart';

class UpdateTransactionUsecase {
  final TransactionService service;

  UpdateTransactionUsecase(this.service);

  Future<void> call({
    required String id,
    required TransactionType type,
    required String description,
    required String category,
    required double amount,
    required DateTime date,
    XFile? newReceiptImage,
    String? currentImageUrl,
  }) {
    return service.updateTransaction(
      id: id,
      type: type,
      description: description,
      category: category,
      amount: amount,
      date: date,
      newReceiptImage: newReceiptImage,
      currentImageUrl: currentImageUrl,
    );
  }
}