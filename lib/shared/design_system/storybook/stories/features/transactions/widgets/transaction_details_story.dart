import 'package:storybook_flutter/storybook_flutter.dart';

import '../../../../../../../features/transactions/data/models/transaction_model.dart';
import '../../../../../../../features/transactions/domain/enums/transaction_type.dart';
import '../../../../previews/features/transactions/widgets/transaction_details_preview.dart';

final List<Story> transactionDetailsStories = [
  Story(
    name: 'Widgets/Transactions/DetailsModal',
    description: 'Modal de detalhes e edição de transação.',
    builder: (context) {
      /// Controle se a transação fake tem imagem ou não
      final hasImage = context.knobs.boolean(
        label: 'Possui Comprovante',
        initial: true,
      );

      /// Controle se é entrada ou saída para testar as cores e categorias
      final isIncome = context.knobs.boolean(
        label: 'É Entrada?',
        initial: false,
      );

      final transaction = TransactionModel(
        id: 'detail-knob-1',
        type: isIncome ? TransactionType.income : TransactionType.expense,
        description: 'Assinatura Adobe Cloud',
        category: isIncome ? 'Freelance' : 'Assinaturas',
        amount: 124.90,
        date: DateTime.now(),
        receiptImageUrl: hasImage 
            ? 'https://picsum.photos/seed/tc3/400/200' 
            : null,
      );

      return TransactionDetailsPreview(transaction: transaction);
    },
  ),
];