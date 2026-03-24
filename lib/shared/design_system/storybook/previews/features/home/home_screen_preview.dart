import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../../../../../features/home/presentation/screens/home_screen.dart';
import '../../../../../../features/transactions/presentation/controllers/transaction_controller.dart';
import '../../../support/mocks/features/home/home_controller_mock.dart';
import '../../../support/mocks/features/home/home_data_factory.dart';

class HomeScreenPreview extends StatelessWidget {
  final double balance;
  final String income;
  final String expense;

  const HomeScreenPreview({
    super.key,
    required this.balance,
    required this.income,
    required this.expense,
  });

  @override
  Widget build(BuildContext context) {
    final mockController = MockTransactionController();

    when(() => mockController.isLoading).thenReturn(false);
    
    /// Mock que vem do Storybook (Knobs)
    when(() => mockController.balance).thenReturn(balance);
    when(() => mockController.formattedCurrentMonthIncome).thenReturn(income);
    when(() => mockController.formattedCurrentMonthExpense).thenReturn(expense);

    /// Dados fixos que não precisam de Knobs (vêm da Factory)
    when(() => mockController.expensesByCategory).thenReturn(HomeDataFactory.donutDataDefault);
    when(() => mockController.weeklyCashFlow).thenReturn(HomeDataFactory.weeklyDataDefault);
    when(() => mockController.transactions).thenReturn([]);
    when(() => mockController.currentMonthTransactions).thenReturn([]);

    return ChangeNotifierProvider<TransactionController>.value(
      value: mockController,
      child: const HomeScreen(),
    );
  }
}