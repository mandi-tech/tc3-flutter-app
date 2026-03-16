import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../features/auth/data/services/auth_service.dart';
import '../tokens/app_colors.dart';
import '../tokens/app_spacing.dart';
import '../tokens/app_typography.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;

  const AppTopBar({
    super.key,
    required this.title,
    this.showBackButton = false,
  });

  String _getFirstName(String? fullName) {
    if (fullName == null || fullName.isEmpty) return "Usuário";
    return fullName.split(" ").first;
  }

  String _getInitial(String name) {
    return name.substring(0, 1).toUpperCase();
  }

  String _greeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) return "Bom dia";
    if (hour < 18) return "Boa tarde";
    return "Boa noite";
  }

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
    final user = auth.currentUser;

    final firstName = _getFirstName(user?.displayName);

    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.surface,
      centerTitle: false,
      titleSpacing: AppSpacing.lg,
      leading: showBackButton
        ? IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              if (context.canPop()) {
                context.pop();
              } else {
                context.go('/main');
              }
            },
          )
        : null,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppSpacing.md),
          Text(
            "${_greeting()}, $firstName 👋",
            style: AppTypography.caption.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            title,
            style: AppTypography.subtitle.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),

      actions: [
        Padding(
          padding: const EdgeInsets.only(right: AppSpacing.lg, top: AppSpacing.md),
          child: GestureDetector(
            onTap: () => context.push('/account'),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: AppColors.primary.withOpacity(0.15),
              child: Text(
                _getInitial(firstName),
                style: AppTypography.subtitle.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}