import 'package:mocktail/mocktail.dart';
import '../../../../../../../features/transactions/presentation/controllers/transaction_controller.dart';

/// Classe global de Mock para o TransactionController.
/// Registre uma vez e use em todos os previews da feature Home.
class MockTransactionController extends Mock implements TransactionController {}