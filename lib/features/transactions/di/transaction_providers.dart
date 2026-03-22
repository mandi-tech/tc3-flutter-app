import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../data/services/transaction_service.dart';
import '../domain/usecases/add_transaction_usecase.dart';
import '../domain/usecases/delete_transaction_usecase.dart';
import '../domain/usecases/get_monthly_summary_usecase.dart';
import '../domain/usecases/get_transaction_charts_usecase.dart';
import '../domain/usecases/get_transaction_stats_usecase.dart';
import '../domain/usecases/get_transaction_weekly_usecase.dart';
import '../presentation/controllers/transaction_controller.dart';

List<SingleChildWidget> transactionProviders = [
  /// Service
  Provider(
    create: (_) => TransactionService(),
  ),

  /// Usecases
  Provider(
    create: (context) => AddTransactionUsecase(context.read<TransactionService>()),
  ),
  Provider(
    create: (context) => DeleteTransactionUsecase(context.read<TransactionService>()),
  ),
  Provider(
    create: (context) => GetMonthlySummaryUsecase(),
  ),
  Provider(
    create: (context) => GetTransactionStatsUsecase(),
  ),
  Provider(
    create: (context) => GetTransactionChartsUsecase(),
  ),
  Provider(
    create: (context) => GetTransactionWeeklyUsecase(),
  ),

  /// Controller
  ChangeNotifierProvider(
    create: (context) => TransactionController(
      service: context.read<TransactionService>(),
      addTransactionUsecase: context.read<AddTransactionUsecase>(),
      deleteTransactionUsecase: context.read<DeleteTransactionUsecase>(),
      getMonthlySummary: context.read<GetMonthlySummaryUsecase>(),
      statsUsecase: context.read<GetTransactionStatsUsecase>(),
      chartsUsecase: context.read<GetTransactionChartsUsecase>(),
      weeklyUsecase: context.read<GetTransactionWeeklyUsecase>(),
    ),
  ),
];