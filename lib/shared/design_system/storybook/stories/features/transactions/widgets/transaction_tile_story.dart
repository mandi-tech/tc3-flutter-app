import 'package:storybook_flutter/storybook_flutter.dart';

import '../../../../../../../features/transactions/data/models/transaction_model.dart';
import '../../../../../../../features/transactions/domain/enums/transaction_type.dart';
import '../../../../previews/features/transactions/widgets/transaction_tile_preview.dart';

final List<Story> transactionTileStories = [
  Story(
    name: 'Widgets/Transactions/Transaction Tile',
    description: 'Teste as variações do item de transação usando os Knobs.',
    builder: (context) {
      // Knobs para controle dinâmico
      final type = context.knobs.options<TransactionType>(
        label: 'Tipo',
        initial: TransactionType.expense,
        options: const [
          Option(label: 'Entrada (Income)', value: TransactionType.income),
          Option(label: 'Saída (Expense)', value: TransactionType.expense),
        ],
      );

      final description = context.knobs.text(
        label: 'Descrição',
        initial: 'Mercado',
      );

      final category = context.knobs.text(
        label: 'Categoria',
        initial: 'Alimentação',
      );

      final amount = context.knobs.slider(
        label: 'Valor',
        min: 0,
        max: 10000,
        initial: 120.90,
      );

      final hasImage = context.knobs.boolean(
        label: 'Possui Recibo',
        initial: false,
      );

      final transaction = TransactionModel(
        id: 'tile-1',
        type: type,
        description: description,
        category: category,
        amount: amount,
        date: DateTime.now(),
        receiptImageUrl: hasImage ? 'https://via.placeholder.com/150' : null,
      );

      return TransactionTilePreview(transaction: transaction);
    },
  ),
];