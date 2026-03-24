import 'package:flutter/material.dart';
import '../../../../../../../features/transactions/data/models/transaction_model.dart';
import '../../../../../../../features/transactions/domain/enums/transaction_type.dart';
import '../../../../../../../features/transactions/presentation/utils/transaction_grouping.dart';
import '../../../../../../../features/transactions/presentation/widgets/transaction_group_section.dart';

class TransactionGroupPreview extends StatelessWidget {
  final String title;
  final bool hasLongTexts;

  const TransactionGroupPreview({
    super.key, 
    this.title = 'Hoje',
    this.hasLongTexts = false,
  });

  @override
  Widget build(BuildContext context) {
    final group = TransactionGroup(
      title: title,
      transactions: [
        TransactionModel(
          id: '1',
          type: TransactionType.expense,
          description: hasLongTexts 
              ? 'Compra no Mercado Central com Carrinho Cheio e Sacolas' 
              : 'Mercado',
          category: 'Alimentação',
          amount: hasLongTexts ? 99999.99 : 120.90,
          date: DateTime.now(),
        ),
        TransactionModel(
          id: '2',
          type: TransactionType.income,
          description: 'Freelance Design',
          category: 'Trabalho',
          amount: 1500.00,
          date: DateTime.now(),
        ),
      ],
    );

    return TransactionGroupSection(
      group: group,
      onDelete: (id) async => debugPrint('Deletando $id'),
    );
  }
}