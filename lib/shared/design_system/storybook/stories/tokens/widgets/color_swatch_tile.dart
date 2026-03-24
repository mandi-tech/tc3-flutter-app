import 'package:flutter/material.dart';

import '../../../../../utils/theme_extensions.dart';
import '../../../../tokens/app_spacing.dart';
import '../models/color_item.dart';

class ColorSwatchTile extends StatelessWidget {
  final ColorItem item;

  const ColorSwatchTile({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final textColor =
        item.color.computeLuminance() > 0.6 ? Colors.black : Colors.white;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: item.color,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: context.colors.outlineVariant,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              item.name,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Text(
            _toHex(item.color),
            style: TextStyle(
              color: textColor.withOpacity(0.9),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  String _toHex(Color color) {
    return '#${color.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}';
  }
}