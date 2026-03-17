import 'package:flutter/material.dart';
import '../../../../../../../features/home/presentation/widgets/balance_card.dart';
import '../../../../stories/widgets/story_preview_frame.dart';

class BalanceCardPreview extends StatelessWidget {
  final double balance;

  const BalanceCardPreview({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    return StoryPreviewFrame(
      width: 350,
      title: 'Balance Card',
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: BalanceCard(balance: balance), 
      ),
    );
  }
}