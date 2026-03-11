import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../data/models/transaction_model.dart';
import '../../data/services/transaction_service.dart';
import '../utils/transaction_filter.dart';
import '../utils/transaction_grouping.dart';

class TransactionController extends ChangeNotifier {
  final TransactionService service;

  TransactionController({
    required this.service,
  });

  final TextEditingController searchController = TextEditingController();

  final List<TransactionModel> _transactions = [];
  List<TransactionModel> get transactions => List.unmodifiable(_transactions);

  StreamSubscription<List<TransactionModel>>? _subscription;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  TransactionFilter _filter = const TransactionFilter();
  TransactionFilter get filter => _filter;

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
        _errorMessage = null;
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
    final categories = _transactions.map((e) => e.category).toSet().toList();
    categories.sort();
    return categories;
  }

  List<TransactionModel> get filteredTransactions {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    return _transactions.where((transaction) {
      final matchesType = switch (_filter.type) {
        TransactionTypeFilter.all => true,
        TransactionTypeFilter.income => transaction.type == 'income',
        TransactionTypeFilter.expense => transaction.type == 'expense',
      };

      final matchesCategory = _filter.category == null
          ? true
          : transaction.category == _filter.category;

      final matchesSearch = _filter.searchQuery.trim().isEmpty
          ? true
          : transaction.description
              .toLowerCase()
              .contains(_filter.searchQuery.toLowerCase());

      final transactionDate = DateTime(
        transaction.date.year,
        transaction.date.month,
        transaction.date.day,
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
    final Map<String, List<TransactionModel>> grouped = {};

    for (final transaction in filteredTransactions) {
      final key = DateFormat('yyyy-MM-dd').format(transaction.date);

      grouped.putIfAbsent(key, () => []);
      grouped[key]!.add(transaction);
    }

    final entries = grouped.entries.toList()
      ..sort((a, b) => b.key.compareTo(a.key));

    return entries.map((entry) {
      final date = DateTime.parse(entry.key);

      return TransactionGroup(
        title: _formatGroupTitle(date),
        transactions: entry.value,
      );
    }).toList();
  }

  String _formatGroupTitle(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final transactionDate = DateTime(date.year, date.month, date.day);
    final difference = today.difference(transactionDate).inDays;

    if (difference == 0) return 'Hoje';
    if (difference == 1) return 'Ontem';

    return DateFormat('dd/MM/yyyy').format(date);
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
    searchController.dispose();
    super.dispose();
  }
}