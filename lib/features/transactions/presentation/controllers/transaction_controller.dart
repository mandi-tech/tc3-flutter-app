import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/models/transaction_model.dart';
import '../../data/services/transaction_service.dart';
import '../../domain/enums/transaction_type.dart';
import '../../domain/usecases/add_transaction_usecase.dart';
import '../../domain/usecases/delete_transaction_usecase.dart';
import '../../domain/usecases/get_monthly_summary_usecase.dart';
import '../../domain/usecases/get_transaction_charts_usecase.dart';
import '../../domain/usecases/get_transaction_stats_usecase.dart';
import '../../domain/usecases/get_transaction_weekly_usecase.dart';
import '../../domain/usecases/update_transaction_usecase.dart';
import '../formatters/transaction_formatters.dart';

class TransactionController extends ChangeNotifier {
  final TransactionService service;
  final GetMonthlySummaryUsecase getMonthlySummary;
  final GetTransactionStatsUsecase statsUsecase;
  final GetTransactionChartsUsecase chartsUsecase;
  final GetTransactionWeeklyUsecase weeklyUsecase;
  final DeleteTransactionUsecase deleteTransactionUsecase;
  final AddTransactionUsecase addTransactionUsecase;
  final UpdateTransactionUsecase updateTransactionUsecase;

  TransactionController({
    required this.service,
    required this.statsUsecase,
    required this.chartsUsecase,
    required this.weeklyUsecase,
    required this.deleteTransactionUsecase,
    required this.getMonthlySummary,
    required this.addTransactionUsecase,
    required this.updateTransactionUsecase,
  });

  final List<TransactionModel> _transactions = [];
  StreamSubscription<List<TransactionModel>>? _subscription;

  bool _isLoading = false;
  String? _errorMessage;

  List<TransactionModel> get transactions => List.unmodifiable(_transactions);
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void startListening() {
    _setLoading(true);

    _subscription?.cancel();

    _subscription = service.getTransactions().listen(
      _handleTransactionsLoaded,
      onError: (_) => _handleTransactionsError(),
    );
  }

  Future<void> deleteTransaction(String id) async {
    await deleteTransactionUsecase(id);
  }

  Future<void> addTransaction({
    required TransactionType type,
    required String description,
    required String category,
    required double amount,
    required DateTime date,
    XFile? receiptImage,
  }) async {
    try {
      await addTransactionUsecase(
        type: type,
        description: description,
        category: category,
        amount: amount,
        date: date,
        receiptImage: receiptImage,
      );
    } catch (e) {
      debugPrint("Erro capturado no TransactionController: $e");
      rethrow; 
    }
  }

  Future<void> updateTransaction({
    required String id,
    required TransactionType type,
    required String description,
    required String category,
    required double amount,
    required DateTime date,
    XFile? newReceiptImage,
    String? currentImageUrl,
  }) async {
    try {
      // Reutilizamos o addTransactionUsecase ou o novo updateTransactionUsecase
      await updateTransactionUsecase(
        id: id,
        type: type,
        description: description,
        category: category,
        amount: amount,
        date: date,
        newReceiptImage: newReceiptImage,
        currentImageUrl: currentImageUrl,
      );
    } catch (e) {
      rethrow;
    }
  }

  /// STATS

  double get totalIncome =>
      statsUsecase.totalIncome(transactions);

  double get totalExpense =>
      statsUsecase.totalExpense(transactions);

  double get balance =>
      statsUsecase.balance(transactions);

  /// Mês

  List<TransactionModel> get currentMonthTransactions =>
      statsUsecase.currentMonthTransactions(transactions);

  double get currentMonthIncome =>
      statsUsecase.currentMonthIncome(transactions);

  double get currentMonthExpense =>
      statsUsecase.currentMonthExpense(transactions);

  MonthlySummary get monthlySummary {
    return getMonthlySummary(_transactions);
  }

  String get formattedCurrentMonthIncome =>
    TransactionFormatters.currency(monthlySummary.income);

  String get formattedCurrentMonthExpense =>
      TransactionFormatters.currency(monthlySummary.expense);

  double get currentMonthBalance => monthlySummary.balance;

  /// Gráficos

  Map<String, double> get expensesByCategory =>
      chartsUsecase.expensesByCategory(currentMonthTransactions);

  Map<int, double> get expensesByDay =>
      chartsUsecase.expensesByDay(currentMonthTransactions);

  /// Semanal

  Map<int, double> get weeklyCashFlow =>
      weeklyUsecase.weeklyCashFlow(transactions);

  double get weeklyBalance =>
      weeklyUsecase.weeklyBalance(transactions);

  /// Privado

  void _handleTransactionsLoaded(List<TransactionModel> data) {
    _transactions
      ..clear()
      ..addAll(data);

    _isLoading = false;
    notifyListeners();
  }

  void _handleTransactionsError() {
    _isLoading = false;
    _errorMessage = 'Erro ao carregar transações.';
    notifyListeners();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}