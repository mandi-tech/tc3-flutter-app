import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/models/transaction_model.dart';
import '../../data/services/transaction_service.dart';
import '../enums/transaction_type.dart';
import '../formatters/transaction_formatters.dart';
import '../utils/transaction_filter.dart';
import '../utils/transaction_grouping.dart';

class TransactionController extends ChangeNotifier {
  final TransactionService service;

  TransactionController({
    required this.service,
  });

  final TextEditingController searchController = TextEditingController();

  final List<TransactionModel> _transactions = [];
  StreamSubscription<List<TransactionModel>>? _subscription;

  bool _isLoading = false;
  String? _errorMessage;
  TransactionFilter _filter = const TransactionFilter();

  List<TransactionModel> get transactions => List.unmodifiable(_transactions);
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  TransactionFilter get filter => _filter;

  void startListening() {
    _setLoading(true);
    _clearError();

    _subscription?.cancel();

    _subscription = service.getTransactions().listen(
      _handleTransactionsLoaded,
      onError: (_) => _handleTransactionsError(),
    );
  }

  Future<void> addTransaction({
    required TransactionType type,
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

  void setTypeFilter(TransactionTypeFilter type) {
    _filter = _filter.copyWith(type: type);
    notifyListeners();
  }

  void setPeriodFilter(TransactionPeriodFilter period) {
    _filter = _filter.copyWith(period: period);
    notifyListeners();
  }

  void setCategoryFilter(String? category) {
    _filter = _filter.copyWith(
      category: category,
      clearCategory: category == null || category.isEmpty,
    );
    notifyListeners();
  }

  void setSearchQuery(String value) {
    _filter = _filter.copyWith(searchQuery: value);
    notifyListeners();
  }

  void clearFilters() {
    searchController.clear();
    _filter = const TransactionFilter();
    notifyListeners();
  }

  List<String> get availableCategories {
    final categories = _transactions
        .map((transaction) => transaction.category)
        .toSet()
        .toList()
      ..sort();

    return categories;
  }

  List<TransactionModel> get filteredTransactions {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    return _transactions.where((transaction) {
      final transactionDate = DateTime(
        transaction.date.year,
        transaction.date.month,
        transaction.date.day,
      );

      final matchesType = switch (_filter.type) {
        TransactionTypeFilter.all => true,
        TransactionTypeFilter.income => transaction.type.isIncome,
        TransactionTypeFilter.expense => transaction.type.isExpense,
      };

      final matchesCategory = _filter.category == null
          ? true
          : transaction.category == _filter.category;

      final matchesSearch = _filter.searchQuery.trim().isEmpty
          ? true
          : transaction.description.toLowerCase().contains(
                _filter.searchQuery.toLowerCase(),
              );

      final matchesPeriod = switch (_filter.period) {
        TransactionPeriodFilter.all => true,
        TransactionPeriodFilter.today => transactionDate == today,
        TransactionPeriodFilter.last7Days =>
          !transactionDate.isBefore(today.subtract(const Duration(days: 6))),
        TransactionPeriodFilter.last30Days =>
          !transactionDate.isBefore(today.subtract(const Duration(days: 29))),
        TransactionPeriodFilter.currentMonth =>
          transaction.date.year == now.year &&
          transaction.date.month == now.month,
      };

      return matchesType &&
          matchesCategory &&
          matchesSearch &&
          matchesPeriod;
    }).toList();
  }

  List<TransactionGroup> get groupedFilteredTransactions {
    final grouped = <String, List<TransactionModel>>{};

    for (final transaction in filteredTransactions) {
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

  List<TransactionModel> get currentMonthTransactions {
    final now = DateTime.now();

    return _transactions.where((transaction) {
      return transaction.date.year == now.year &&
          transaction.date.month == now.month;
    }).toList();
  }

  double get totalIncome => _sumByType(_transactions, TransactionType.income);
  double get totalExpense => _sumByType(_transactions, TransactionType.expense);
  double get balance => totalIncome - totalExpense;

  double get filteredIncome =>
      _sumByType(filteredTransactions, TransactionType.income);

  double get filteredExpense =>
      _sumByType(filteredTransactions, TransactionType.expense);

  double get filteredBalance => filteredIncome - filteredExpense;

  double get currentMonthIncome =>
      _sumByType(currentMonthTransactions, TransactionType.income);

  double get currentMonthExpense =>
      _sumByType(currentMonthTransactions, TransactionType.expense);

  double get currentMonthBalance => currentMonthIncome - currentMonthExpense;

  Map<String, double> get expensesByCategory {
    final Map<String, double> result = {};

    for (final transaction in currentMonthTransactions) {
      if (transaction.type.isExpense) {
        result.update(
          transaction.category,
          (value) => value + transaction.amount,
          ifAbsent: () => transaction.amount,
        );
      }
    }

    return result;
  }

  Map<int, double> get expensesByDay {
    final Map<int, double> result = {};

    for (final transaction in currentMonthTransactions) {
      if (transaction.type.isExpense) {
        final day = transaction.date.day;

        result.update(
          day,
          (value) => value + transaction.amount,
          ifAbsent: () => transaction.amount,
        );
      }
    }

    return result;
  }

  Map<String, double> get incomeVsExpense {
    return {
      "Receitas": currentMonthIncome,
      "Despesas": currentMonthExpense,
    };
  }

  String get formattedBalance => TransactionFormatters.currency(balance);
  String get formattedIncome => TransactionFormatters.currency(totalIncome);
  String get formattedExpense => TransactionFormatters.currency(totalExpense);

  String get formattedFilteredBalance =>
      TransactionFormatters.currency(filteredBalance);

  String get formattedFilteredIncome =>
      TransactionFormatters.currency(filteredIncome);

  String get formattedFilteredExpense =>
      TransactionFormatters.currency(filteredExpense);

  String get formattedCurrentMonthBalance =>
      TransactionFormatters.currency(currentMonthBalance);

  String get formattedCurrentMonthIncome =>
      TransactionFormatters.currency(currentMonthIncome);

  String get formattedCurrentMonthExpense =>
      TransactionFormatters.currency(currentMonthExpense);

  double _sumByType(
    List<TransactionModel> transactions,
    TransactionType type,
  ) {
    double total = 0;

    for (final transaction in transactions) {
      if (transaction.type == type) {
        total += transaction.amount;
      }
    }

    return total;
  }

  void _handleTransactionsLoaded(List<TransactionModel> data) {
    _transactions
      ..clear()
      ..addAll(data);

    _isLoading = false;
    _errorMessage = null;
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

  void _clearError() {
    _errorMessage = null;
  }

  @override
  void dispose() {
    _subscription?.cancel();
    searchController.dispose();
    super.dispose();
  }
}