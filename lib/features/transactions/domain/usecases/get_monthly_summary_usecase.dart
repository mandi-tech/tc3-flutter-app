import '../../data/models/transaction_model.dart';
import '../enums/transaction_type.dart';

class MonthlySummary {
  final double income;
  final double expense;

  const MonthlySummary({
    required this.income,
    required this.expense,
  });

  double get balance => income - expense;
}

class GetMonthlySummaryUsecase {
  MonthlySummary call(List<TransactionModel> transactions) {
    final now = DateTime.now();

    double income = 0;
    double expense = 0;

    for (final transaction in transactions) {
      final date = transaction.date;

      if (date.year == now.year && date.month == now.month) {
        if (transaction.type == TransactionType.income) {
          income += transaction.amount;
        } else {
          expense += transaction.amount;
        }
      }
    }

    return MonthlySummary(
      income: income,
      expense: expense,
    );
  }
}