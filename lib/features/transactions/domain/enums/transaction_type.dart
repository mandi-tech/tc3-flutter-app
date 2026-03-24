enum TransactionType {
  income,
  expense,
}

extension TransactionTypeX on TransactionType {
  String get value {
    switch (this) {
      case TransactionType.income:
        return 'income';
      case TransactionType.expense:
        return 'expense';
    }
  }

  bool get isIncome => this == TransactionType.income;
  bool get isExpense => this == TransactionType.expense;
}

extension TransactionTypeParsing on String {
  TransactionType toTransactionType() {
    switch (toLowerCase()) {
      case 'income':
        return TransactionType.income;
      case 'expense':
        return TransactionType.expense;
      default:
        throw ArgumentError('Tipo de transação inválido: $this');
    }
  }
}