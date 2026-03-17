import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../features/home/presentation/screens/home_screen.dart';
import '../../../../../../features/transactions/presentation/controllers/transaction_controller.dart';
import '../../../widgets/story_preview_frame.dart';

class MockTransactionController extends Mock implements TransactionController {}

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

    /// Mock de Estado e Valores Básicos
    when(() => mockController.isLoading).thenReturn(false);
    when(() => mockController.balance).thenReturn(balance);
    when(() => mockController.formattedCurrentMonthIncome).thenReturn(income);
    when(() => mockController.formattedCurrentMonthExpense).thenReturn(expense);

    /// Mock de Listas (Essencial para não dar erro de Null nas funções de extensão)
    when(() => mockController.transactions).thenReturn([]);
    when(() => mockController.currentMonthTransactions).thenReturn([]);

    /// Mock para o ExpensesDonutChart (Map<String, double>)
    when(() => mockController.expensesByCategory).thenReturn({
      'Alimentação': 1200.0,
      'Transporte': 450.0,
      'Lazer': 300.0,
    });

    /// Mock para o WeeklyCashflowChart (Map<int, double>)
    when(() => mockController.weeklyCashFlow).thenReturn({
      1: 150.0,  /// Seg
      2: -50.0,  /// Ter
      3: 200.0,  /// Qua
      4: 0.0,    /// Qui
      5: -120.0, /// Sex
      6: 400.0,  /// Sab
      7: 350.0,  /// Dom
    });

    /// Outros getters que podem ser chamados
    when(() => mockController.expensesByDay).thenReturn({});
    when(() => mockController.weeklyBalance).thenReturn(balance);

    return StoryPreviewFrame(
      width: 390,
      title: 'Home Screen',
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 600),
        child: Scaffold(
          body: ChangeNotifierProvider<TransactionController>.value(
            value: mockController,
            child: const HomeScreen(),
          ),
        ),
      ),
    );
  }
}