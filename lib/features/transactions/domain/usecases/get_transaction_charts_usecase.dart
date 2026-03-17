import '../../data/models/transaction_model.dart';
import '../enums/transaction_type.dart';

class GetTransactionChartsUsecase {

  Map<String, double> expensesByCategory(
      List<TransactionModel> transactions) {

    final Map<String, double> result = {};

    for (final t in transactions) {

      if (t.type.isExpense) {

        result.update(
          t.category,
          (value) => value + t.amount,
          ifAbsent: () => t.amount,
        );

      }
    }

    return result;
  }

  Map<int, double> expensesByDay(
      List<TransactionModel> transactions) {

    final Map<int, double> result = {};

    for (final t in transactions) {

      if (t.type.isExpense) {

        final day = t.date.day;

        result.update(
          day,
          (value) => value + t.amount,
          ifAbsent: () => t.amount,
        );

      }
    }

    return result;
  }
}