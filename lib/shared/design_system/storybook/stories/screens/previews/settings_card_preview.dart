import 'package:flutter/material.dart';

import '../../../../../utils/theme_extensions.dart';

class SettingsCardPreview extends StatelessWidget {
  final Widget child;

  const SettingsCardPreview({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: context.colors.outlineVariant,
        ),
      ),
      child: child,
    );
  }
}