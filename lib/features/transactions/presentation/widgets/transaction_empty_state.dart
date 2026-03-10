import 'package:flutter/material.dart';

class TransactionEmptyState extends StatelessWidget {
  const TransactionEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.receipt_long_outlined,
              size: 64,
            ),
            SizedBox(height: 16),
            Text(
              'Nenhuma transação encontrada.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              'Adicione uma transação para começar a montar seu histórico.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}