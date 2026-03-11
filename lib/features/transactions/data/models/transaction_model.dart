import 'package:cloud_firestore/cloud_firestore.dart';

import '../../presentation/enums/transaction_type.dart';

class TransactionModel {
  final String id;
  final TransactionType type;
  final String description;
  final String category;
  final double amount;
  final DateTime date;
  final String? receiptImageUrl;

  const TransactionModel({
    required this.id,
    required this.type,
    required this.description,
    required this.category,
    required this.amount,
    required this.date,
    this.receiptImageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type.value, // salva como string
      'description': description,
      'category': category,
      'amount': amount,
      'date': Timestamp.fromDate(date),
      'receiptImageUrl': receiptImageUrl,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }

  factory TransactionModel.fromDoc(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data()!;

    return TransactionModel(
      id: doc.id,
      type: (data['type'] as String).toTransactionType(),
      description: data['description'] ?? '',
      category: data['category'] ?? '',
      amount: (data['amount'] ?? 0).toDouble(),
      date: (data['date'] as Timestamp).toDate(),
      receiptImageUrl: data['receiptImageUrl'],
    );
  }

  TransactionModel copyWith({
    String? id,
    TransactionType? type,
    String? description,
    String? category,
    double? amount,
    DateTime? date,
    String? receiptImageUrl,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      type: type ?? this.type,
      description: description ?? this.description,
      category: category ?? this.category,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      receiptImageUrl: receiptImageUrl ?? this.receiptImageUrl,
    );
  }
}