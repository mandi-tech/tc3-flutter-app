import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../../../../../features/transactions/domain/enums/transaction_type.dart';
import '../../../../tokens/app_spacing.dart';
import '../../widgets/story_preview_frame.dart';
import '../../../previews/features/transactions/add_transaction_preview.dart';

final List<Story> addTransactionStories = [
  Story(
    name: 'Screens/Add Transaction',
    description: 'Tela de criação de nova transação.',
    builder: (context) {
      final isExpense = context.knobs.boolean(label: 'É Despesa?', initial: true);
      
      return StoryPreviewFrame(
        width: 400,
        title: isExpense ? 'Nova Despesa' : 'Nova Receita',
        child: AddTransactionPreview(
          type: isExpense ? TransactionType.expense : TransactionType.income,
        ),
      );
    },
  ),

  Story(
    name: 'Screens/Responsive/Add Transaction Responsive',
    builder: (context) => SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xl),
      child: Column(
        children: [
          StoryPreviewFrame(
            width: 320, 
            title: 'Mobile Small', 
            child: AddTransactionPreview(type: TransactionType.expense),
          ),
          const SizedBox(height: AppSpacing.xl),
          StoryPreviewFrame(
            width: 390, 
            title: 'Mobile Large', 
            child: AddTransactionPreview(type: TransactionType.expense),
          ),
          const SizedBox(height: AppSpacing.xl),
          StoryPreviewFrame(
            width: 600,
            title: 'Tablet', 
            child: AddTransactionPreview(type: TransactionType.expense),
          ),
        ],
      ),
    ),
  ),
];