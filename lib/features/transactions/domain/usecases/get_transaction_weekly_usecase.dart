import '../../data/models/transaction_model.dart';
import '../enums/transaction_type.dart';

class GetTransactionWeeklyUsecase {

  DateTime _startOfWeek(DateTime date) {
    final difference = date.weekday % 7;
    final start = date.subtract(Duration(days: difference));

    return DateTime(start.year, start.month, start.day);
  }

  Map<int, double> weeklyCashFlow(
      List<TransactionModel> transactions) {

    final Map<int, double> result = {};
    final now = DateTime.now();

    final start = _startOfWeek(now);
    final end = start.add(const Duration(days: 7));

    for (final t in transactions) {

      if (t.date.isAfter(start.subtract(const Duration(seconds: 1))) &&
          t.date.isBefore(end)) {

        final weekday = (t.date.weekday % 7) + 1;

        final value = t.type.isExpense
            ? -t.amount
            : t.amount;

        result.update(
          weekday,
          (existing) => existing + value,
          ifAbsent: () => value,
        );
      }
    }

    return result;
  }

  double weeklyBalance(List<TransactionModel> transactions) {

    final flow = weeklyCashFlow(transactions);

    if (flow.isEmpty) return 0;

    return flow.values.reduce((a, b) => a + b);
  }
}