import 'package:flutter/material.dart';
import '../../../../../../../features/register/presentation/widgets/register_header.dart';
import '../../../../../tokens/app_spacing.dart';

class RegisterHeaderPreview extends StatelessWidget {
  const RegisterHeaderPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          // Padding lateral para o header não colar nas bordas
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Column(
            children: [
              // Espaçamento simulando o topo da tela
              const SizedBox(height: AppSpacing.lg),
              const RegisterHeader(),
              // Espaçamento simulando o início do formulário
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
                  child: const Center(
                    child: Text('Área do Formulário (Simulada)'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}