import '../../data/models/transaction_model.dart';
import '../formatters/transaction_formatters.dart';
import '../utils/transaction_grouping.dart';

class TransactionGroupMapper {

  static List<TransactionGroup> groupByDate(
      List<TransactionModel> transactions) {

    final grouped = <String, List<TransactionModel>>{};

    for (final transaction in transactions) {

      final key = TransactionFormatters.groupKey(transaction.date);

      grouped.putIfAbsent(key, () => []);

      grouped[key]!.add(transaction);
    }

    final entries = grouped.entries.toList()
      ..sort((a, b) => b.key.compareTo(a.key));

    return entries.map((entry) {

      final date = DateTime.parse(entry.key);

      return TransactionGroup(
        title: TransactionFormatters.groupTitle(date),
        transactions: entry.value,
      );

    }).toList();
  }
}