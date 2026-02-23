import 'package:flutter/material.dart';

import 'shared/design_system/components/app_button.dart';
import 'shared/design_system/themes/app_theme.dart';
import 'shared/design_system/tokens/app_spacing.dart';
import 'shared/design_system/tokens/app_typography.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance Manager',
      theme: AppTheme.light(),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _balance = 0;

  void _addIncome() {
    setState(() => _balance += 50);
  }

  void _addExpense() {
    setState(() => _balance -= 20);
  }

  void _reset() {
    setState(() => _balance = 0);
  }

  @override
  Widget build(BuildContext context) {
    final isNegative = _balance < 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciador Financeiro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Resumo',
              style: AppTypography.title,
            ),
            const SizedBox(height: AppSpacing.md),

            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Saldo atual', style: AppTypography.caption),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    'R\$ ${_balance.toStringAsFixed(2)}',
                    style: AppTypography.title.copyWith(
                      fontSize: 28,
                      color: isNegative
                          ? Theme.of(context).colorScheme.error
                          : Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'Simulação usando tokens + AppButton.',
                    style: AppTypography.body.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.xl),

            AppButton(
              label: 'Adicionar receita (+R\$ 50)',
              variant: AppButtonVariant.primary,
              onPressed: _addIncome,
            ),
            const SizedBox(height: AppSpacing.sm),

            AppButton(
              label: 'Adicionar despesa (-R\$ 20)',
              variant: AppButtonVariant.secondary,
              onPressed: _addExpense,
            ),
            const SizedBox(height: AppSpacing.sm),

            AppButton(
              label: 'Zerar saldo',
              variant: AppButtonVariant.danger,
              onPressed: _reset,
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}