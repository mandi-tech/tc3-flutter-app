class TransactionEntity {
  final String id;
  final String type;
  final String description;
  final String category;
  final double amount;
  final DateTime date;

  const TransactionEntity({
    required this.id,
    required this.type,
    required this.description,
    required this.category,
    required this.amount,
    required this.date,
  });
}