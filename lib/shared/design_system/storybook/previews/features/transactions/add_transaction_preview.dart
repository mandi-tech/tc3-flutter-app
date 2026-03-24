import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../features/transactions/domain/enums/transaction_type.dart';
import '../../../../../../features/transactions/presentation/controllers/transaction_controller.dart';
import '../../../../../../features/transactions/presentation/screens/add_transaction_screen.dart';

class MockTransactionController extends Mock implements TransactionController {}

class AddTransactionPreview extends StatelessWidget {
  final TransactionType type;

  AddTransactionPreview({super.key, required this.type}) {
    _registerMocks();
  }

  void _registerMocks() {
    try {
      registerFallbackValue(TransactionType.expense);
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final mockController = MockTransactionController();

    when(() => mockController.addTransaction(
          type: any(named: 'type'),
          description: any(named: 'description'),
          category: any(named: 'category'),
          amount: any(named: 'amount'),
          date: any(named: 'date'),
          receiptImage: any(named: 'receiptImage'),
        )).thenAnswer((_) async => {});

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TransactionController>.value(value: mockController),
      ],
      child: Center(
        child: SizedBox(
          width: 375,
          height: 700,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(padding: EdgeInsets.zero),
              child: Theme(
                data: Theme.of(context).copyWith(
                  appBarTheme: const AppBarTheme(
                    toolbarHeight: 0,
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                  ),
                ),
                child: AddTransactionScreen(initialType: type),
              ),
            ),
          ),
        ),
      ),
    );
  }
}