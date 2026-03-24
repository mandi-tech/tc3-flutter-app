import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../features/transactions/presentation/controllers/transaction_controller.dart';
import '../../../../../../features/transactions/presentation/controllers/transaction_filter_controller.dart';
import '../../../../../../features/transactions/presentation/filters/transaction_filter.dart';
import '../../../../../../features/transactions/presentation/screens/transactions_screen.dart';

class MockTransactionController extends Mock implements TransactionController {}
class MockTransactionFilterController extends Mock implements TransactionFilterController {}

class TransactionsScreenPreview extends StatelessWidget {
  const TransactionsScreenPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final mockController = MockTransactionController();
    final mockFilterController = MockTransactionFilterController();

    when(() => mockController.transactions).thenReturn([]);
    when(() => mockController.isLoading).thenReturn(false);
    when(() => mockController.errorMessage).thenReturn(null);
    when(() => mockController.startListening()).thenAnswer((_) async => {});
    when(() => mockFilterController.searchController).thenReturn(TextEditingController());
    when(() => mockFilterController.filter).thenReturn(TransactionFilter(
      type: TransactionTypeFilter.all,
      category: null,
      searchQuery: '',
    ));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TransactionController>.value(value: mockController),
        ChangeNotifierProvider<TransactionFilterController>.value(value: mockFilterController),
      ],
      child: const SizedBox(
        height: 800,
        child: TransactionsScreen(),
      ),
    );
  }
}