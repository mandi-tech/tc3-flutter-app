import 'package:intl/intl.dart';

class TransactionFormatters {
  static final NumberFormat _currencyFormatter = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
  );

  static final DateFormat _groupDateFormatter = DateFormat('dd/MM/yyyy');

  static String currency(double value) {
    return _currencyFormatter.format(value);
  }

  static String groupTitle(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final transactionDate = DateTime(date.year, date.month, date.day);
    final difference = today.difference(transactionDate).inDays;

    if (difference == 0) return 'Hoje';
    if (difference == 1) return 'Ontem';

    return _groupDateFormatter.format(date);
  }

  static String groupKey(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }
}