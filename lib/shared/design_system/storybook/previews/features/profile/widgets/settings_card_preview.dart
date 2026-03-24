import 'package:flutter/material.dart';
import '../../../../../../../features/profile/presentation/widgets/settings_item.dart';
import '../../../../../tokens/app_colors.dart';
import '../../../../../tokens/app_spacing.dart';

class SettingsCardPreview extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? textColor;
  final Color? iconColor;

  const SettingsCardPreview({
    super.key,
    required this.icon,
    required this.label,
    this.textColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.neutral100,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SettingsItem(
              icon: icon,
              label: label,
              iconColor: iconColor,
              textColor: textColor,
              onTap: () {},
            ),
          ),
        ),
      ),
    );
  }
}