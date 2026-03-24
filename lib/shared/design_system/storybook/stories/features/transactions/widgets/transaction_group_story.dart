import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../../../../tokens/app_spacing.dart';
import '../../../../previews/features/transactions/widgets/transaction_group_preview.dart';

final List<Story> transactionGroupSectionStories = [
  Story(
    name: 'Widgets/Transactions/Transactions Group',
    builder: (context) => const Padding(
      padding: EdgeInsets.all(AppSpacing.md),
      child: TransactionGroupPreview(),
    ),
  ),
];