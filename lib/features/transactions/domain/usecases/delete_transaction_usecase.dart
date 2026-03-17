import '../../data/services/transaction_service.dart';

class DeleteTransactionUsecase {
  final TransactionService service;

  DeleteTransactionUsecase(this.service);

  Future<void> call(String id) {
    return service.deleteTransaction(id);
  }
}