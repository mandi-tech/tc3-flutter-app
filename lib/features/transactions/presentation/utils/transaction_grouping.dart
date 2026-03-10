import '../../data/models/transaction_model.dart';

class TransactionGroup {
  final String title;
  final List<TransactionModel> transactions;

  TransactionGroup({
    required this.title,
    required this.transactions,
  });
}