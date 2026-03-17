import 'package:flutter/material.dart';

import '../filters/transaction_filter.dart';

class TransactionFilterController extends ChangeNotifier {

  final TextEditingController searchController = TextEditingController();

  TransactionFilter _filter = const TransactionFilter();

  TransactionFilter get filter => _filter;

  void setType(TransactionTypeFilter type) {
    _filter = _filter.copyWith(type: type);
    notifyListeners();
  }

  void setPeriod(TransactionPeriodFilter period) {
    _filter = _filter.copyWith(period: period);
    notifyListeners();
  }

  void setCategory(String? category) {
    _filter = _filter.copyWith(
      category: category,
      clearCategory: category == null,
    );
    notifyListeners();
  }

  void setSearch(String value) {
    _filter = _filter.copyWith(searchQuery: value);
    notifyListeners();
  }

  void clear() {
    searchController.clear();
    _filter = const TransactionFilter();
    notifyListeners();
  }
}