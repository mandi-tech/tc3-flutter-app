import 'package:flutter/material.dart';

class TransactionFiltersPreview extends StatelessWidget {
  final Widget child;

  const TransactionFiltersPreview({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: IntrinsicHeight(
            child: child,
          ),
        ),
      ),
    );
  }
}