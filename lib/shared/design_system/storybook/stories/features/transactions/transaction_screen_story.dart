import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../../../tokens/app_spacing.dart';
import '../../../previews/features/transactions/transaction_screen_preview.dart';
import '../../widgets/story_preview_frame.dart';

final List<Story> transactionsStories = [
  Story(
    name: 'Screens/Transactions',
    builder: (context) => const StoryPreviewFrame(
      width: 400,
      title: 'Histórico de Transações',
      child: TransactionsScreenPreview(),
    ),
  ),
  Story(
    name: 'Screens/Responsive/Transactions Responsive',
    builder: (_) => SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xl),
      child: Column(
        children: const [
          StoryPreviewFrame(
            width: 320, 
            title: 'Mobile Small', 
            child: TransactionsScreenPreview(),
          ),
          SizedBox(height: AppSpacing.xl),
          StoryPreviewFrame(
            width: 414, 
            title: 'Mobile Large', 
            child: TransactionsScreenPreview(),
          ),
          SizedBox(height: AppSpacing.xl),
          StoryPreviewFrame(
            width: 768, 
            title: 'Tablet View', 
            child: TransactionsScreenPreview(),
          ),
        ],
      ),
    ),
  ),
];