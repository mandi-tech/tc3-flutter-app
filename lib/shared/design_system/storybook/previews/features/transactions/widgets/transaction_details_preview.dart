import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mocktail/mocktail.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../../features/transactions/data/models/transaction_model.dart';
import '../../../../../../../features/transactions/domain/enums/transaction_type.dart';
import '../../../../../../../features/transactions/presentation/controllers/transaction_controller.dart';
import '../../../../../../../features/transactions/presentation/widgets/transaction_details_modal.dart';

class MockTransactionController extends Mock implements TransactionController {}

/// Fake para o XFile se precisar testar upload de imagem no futuro
class FakeXFile extends Fake implements XFile {}

class TransactionDetailsPreview extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionDetailsPreview({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final mockController = MockTransactionController();

    /// Registra os fallbacks para o Mocktail não se perder com tipos customizados
    registerFallbackValue(TransactionType.expense);
    registerFallbackValue(FakeXFile());

    /// Stub para o método de update
    when(() => mockController.updateTransaction(
          id: any(named: 'id'),
          description: any(named: 'description'),
          amount: any(named: 'amount'),
          category: any(named: 'category'),
          date: any(named: 'date'),
          type: any(named: 'type'),
          newReceiptImage: any(named: 'newReceiptImage'),
          currentImageUrl: any(named: 'currentImageUrl'),
        )).thenAnswer((_) async => {});

    return ChangeNotifierProvider<TransactionController>.value(
      value: mockController,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            width: 375,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: TransactionDetailsModal(transaction: transaction),
            ),
          ),
        ),
      ),
    );
  }
}