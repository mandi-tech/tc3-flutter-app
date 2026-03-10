import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/models/transaction_model.dart';
import '../../data/services/transaction_service.dart';

class TransactionController extends ChangeNotifier {
  final TransactionService service;

  TransactionController({
    required this.service,
  });

  final List<TransactionModel> _transactions = [];
  List<TransactionModel> get transactions => List.unmodifiable(_transactions);

  StreamSubscription<List<TransactionModel>>? _subscription;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void startListening() {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    _subscription?.cancel();

    _subscription = service.getTransactions().listen(
      (data) {
        _transactions
          ..clear()
          ..addAll(data);
        _isLoading = false;
        notifyListeners();
      },
      onError: (_) {
        _isLoading = false;
        _errorMessage = 'Erro ao carregar transações.';
        notifyListeners();
      },
    );
  }

  Future<void> addTransaction({
    required String type,
    required String description,
    required String category,
    required double amount,
    required DateTime date,
    XFile? receiptImage,
  }) async {
    await service.addTransaction(
      type: type,
      description: description,
      category: category,
      amount: amount,
      date: date,
      receiptImage: receiptImage,
    );
  }

  Future<void> deleteTransaction(String id) async {
    await service.deleteTransaction(id);
  }

  double get balance {
    double total = 0;

    for (final transaction in _transactions) {
      if (transaction.type == 'income') {
        total += transaction.amount;
      } else {
        total -= transaction.amount;
      }
    }

    return total;
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}