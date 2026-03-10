import 'package:flutter/material.dart';

import '../../utils/theme_extensions.dart';
import '../tokens/app_colors.dart';
import '../tokens/app_spacing.dart';

class AppPickerField extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onTap;
  final Widget? suffixIcon;

  const AppPickerField({
    super.key,
    required this.label,
    required this.value,
    required this.onTap,
    this.suffixIcon,
  });

  OutlineInputBorder _border(Color color, {double width = 1}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: color,
        width: width,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: context.colors.onSurfaceVariant,
          ),
          filled: true,
          fillColor: context.theme.scaffoldBackgroundColor,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.md,
          ),
          enabledBorder: _border(context.colors.onSurfaceVariant),
          focusedBorder: _border(context.colors.primary, width: 1.5),
          errorBorder: _border(AppColors.danger),
          focusedErrorBorder: _border(AppColors.danger, width: 1.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(value),
            suffixIcon ?? const Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
    );
  }
}