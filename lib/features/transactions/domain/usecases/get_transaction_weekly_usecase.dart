import '../../data/models/transaction_model.dart';
import '../enums/transaction_type.dart';

class GetTransactionWeeklyUsecase {
  
  /// Define o início da semana como o último Domingo
  DateTime _startOfWeek(DateTime date) {
    /// No Dart: Seg=1...Sáb=6, Dom=7.
    /// Se for domingo (7), o mod 7 vira 0, subtraindo 0 dias (fica no próprio domingo).
    /// Se for segunda (1), subtrai 1 dia para chegar no domingo anterior.
    final difference = date.weekday % 7;
    final start = date.subtract(Duration(days: difference));

    return DateTime(start.year, start.month, start.day);
  }

  Map<int, double> weeklyCashFlow(List<TransactionModel> transactions) {
    /// Inicializamos o Map com 0.0 para todos os dias (7=Dom, 1=Seg... 6=Sáb)
    /// Isso evita que o gráfico fique "buraco" ou dê erro se um dia não tiver transação.
    final Map<int, double> result = {
      7: 0.0, 1: 0.0, 2: 0.0, 3: 0.0, 4: 0.0, 5: 0.0, 6: 0.0
    };

    final now = DateTime.now();
    final start = _startOfWeek(now);
    final end = start.add(const Duration(days: 7));

    for (final t in transactions) {
      /// Filtra apenas transações da semana atual
      if (t.date.isAfter(start.subtract(const Duration(seconds: 1))) &&
          t.date.isBefore(end)) {
        
        /// Seg=1, Ter=2, Qua=3, Qui=4, Sex=5, Sáb=6, Dom=7.
        final weekday = t.date.weekday;

        final value = t.type == TransactionType.expense
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