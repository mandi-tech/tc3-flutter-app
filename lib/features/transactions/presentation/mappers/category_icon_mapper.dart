import 'package:flutter/material.dart';

class CategoryIconMapper {
  static IconData getIcon(String category) {
    switch (category.toLowerCase()) {
      case 'alimentação':
        return Icons.restaurant;

      case 'transporte':
        return Icons.directions_car;

      case 'moradia':
        return Icons.home;

      case 'saúde':
        return Icons.health_and_safety;

      case 'educação':
        return Icons.school;

      case 'lazer':
        return Icons.sports_esports;

      case 'compras':
        return Icons.shopping_bag;

      case 'assinaturas':
        return Icons.subscriptions;

      case 'salário':
        return Icons.payments;

      case 'freelance':
        return Icons.work;

      case 'investimentos':
        return Icons.trending_up;

      case 'presente':
        return Icons.card_giftcard;

      default:
        return Icons.receipt_long;
    }
  }
}