import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../../../../components/app_button.dart';
import '../../../../../components/app_email_field.dart';
import '../../../../../components/app_password_field.dart';
import '../../../../../tokens/app_spacing.dart';
import '../../../widgets/surface_preview.dart';

final Story loginFormStory = Story(
  name: 'Widgets/Auth/Login Form',
  builder: (context) {
    final isLoading = context.knobs.boolean(label: 'Carregando?', initial: false);

    return SurfacePreview(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const AppEmailField(),
          const SizedBox(height: AppSpacing.md),
          const AppPasswordField(),
          const SizedBox(height: AppSpacing.lg),
          AppButton(
            label: 'Entrar',
            isLoading: isLoading,
            onPressed: () {},
          ),
        ],
      ),
    );
  },
);