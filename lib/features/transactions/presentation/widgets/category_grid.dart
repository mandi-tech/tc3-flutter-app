import 'package:flutter/material.dart';

import '../../../../shared/design_system/tokens/app_spacing.dart';
import '../../../../shared/utils/theme_extensions.dart';

class CategoryGrid extends StatelessWidget {
  final List<String> categories;
  final String? selectedCategory;
  final ValueChanged<String> onSelected;

  const CategoryGrid({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onSelected,
  });

  IconData _iconForCategory(String category) {
    switch (category) {
      case "Alimentação":
        return Icons.restaurant;
      case "Transporte":
        return Icons.directions_car;
      case "Moradia":
        return Icons.home;
      case "Lazer":
        return Icons.sports_esports;
      case "Saúde":
        return Icons.local_hospital;
      case "Compras":
        return Icons.shopping_bag;
      case "Educação":
        return Icons.school;
      case "Assinaturas":
        return Icons.subscriptions;
      case "Salário":
        return Icons.payments;
      case "Freelance":
        return Icons.work;
      case "Investimentos":
        return Icons.trending_up;
      case "Presente":
        return Icons.card_giftcard;
      case "Reembolso":
        return Icons.receipt;
      default:
        return Icons.category;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: categories.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: AppSpacing.sm,
        crossAxisSpacing: AppSpacing.sm,
        childAspectRatio: 1,
      ),
      itemBuilder: (_, index) {
        final category = categories[index];
        final isSelected = category == selectedCategory;

        return GestureDetector(
          onTap: () => onSelected(category),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: isSelected
                  ? context.colors.primary.withOpacity(0.1)
                  : context.colors.surface,
              border: Border.all(
                color: isSelected
                    ? context.colors.primary
                    : context.colors.outline,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(_iconForCategory(category)),
                const SizedBox(height: 6),
                Text(
                  category,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}