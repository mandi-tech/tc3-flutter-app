import '../../data/models/transaction_model.dart';
import '../enums/transaction_type.dart';

class GetTransactionStatsUsecase {

  double totalIncome(List<TransactionModel> transactions) {
    return transactions
        .where((t) => t.type.isIncome)
        .fold(0, (sum, t) => sum + t.amount);
  }

  double totalExpense(List<TransactionModel> transactions) {
    return transactions
        .where((t) => t.type.isExpense)
        .fold(0, (sum, t) => sum + t.amount);
  }

  double balance(List<TransactionModel> transactions) {
    return totalIncome(transactions) - totalExpense(transactions);
  }

  List<TransactionModel> currentMonthTransactions(
      List<TransactionModel> transactions) {

    final now = DateTime.now();

    return transactions.where((t) {
      return t.date.year == now.year &&
          t.date.month == now.month;
    }).toList();
  }

  double currentMonthIncome(List<TransactionModel> transactions) {
    return currentMonthTransactions(transactions)
        .where((t) => t.type.isIncome)
        .fold(0, (sum, t) => sum + t.amount);
  }

  double currentMonthExpense(List<TransactionModel> transactions) {
    return currentMonthTransactions(transactions)
        .where((t) => t.type.isExpense)
        .fold(0, (sum, t) => sum + t.amount);
  }
}