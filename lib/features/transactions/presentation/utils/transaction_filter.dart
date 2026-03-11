enum TransactionTypeFilter {
  all,
  income,
  expense,
}

enum TransactionPeriodFilter {
  all,
  today,
  last7Days,
  last30Days,
  currentMonth,
}

class TransactionFilter {
  final TransactionTypeFilter type;
  final TransactionPeriodFilter period;
  final String? category;
  final String searchQuery;

  const TransactionFilter({
    this.type = TransactionTypeFilter.all,
    this.period = TransactionPeriodFilter.all,
    this.category,
    this.searchQuery = '',
  });

  TransactionFilter copyWith({
    TransactionTypeFilter? type,
    TransactionPeriodFilter? period,
    String? category,
    String? searchQuery,
    bool clearCategory = false,
  }) {
    return TransactionFilter(
      type: type ?? this.type,
      period: period ?? this.period,
      category: clearCategory ? null : (category ?? this.category),
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}