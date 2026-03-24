import 'package:flutter/material.dart';

import '../../../tokens/app_colors.dart';
import '../../../tokens/app_spacing.dart';

class StoryPreviewFrame extends StatelessWidget {
  final double width;
  final String title;
  final Widget child;
  final double? height; // Adicionei um parâmetro opcional de altura

  const StoryPreviewFrame({
    super.key,
    required this.width,
    required this.title,
    required this.child,
    this.height, // Se não passar nada, usaremos um valor padrão
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min, // Mantém o título colado no frame
        children: [
          Text(
            '$title • ${width.toInt()}px',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Container(
            width: width,
            height: height ?? 700, // IMPORTANTE: Define uma altura para o "celular"
            clipBehavior: Clip.antiAlias, // Garante que o conteúdo respeite o borderRadius
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppColors.neutral100),
              // ... seu boxShadow continua aqui ...
            ),
            // Se o conteúdo for maior que a altura do frame, ele precisa de um scroll interno
            child: Material( // Adiciona o Material para widgets que precisam de tema (como TextFields)
              color: Colors.transparent,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}