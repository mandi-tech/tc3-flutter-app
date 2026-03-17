import 'package:flutter/material.dart';

import '../../../components/app_email_field.dart';
import '../../../components/app_password_field.dart';
import '../../../tokens/app_spacing.dart';
import 'widgets/error_field_demo.dart';
import 'widgets/state_story_center.dart';

class AppFieldsStatesStory extends StatelessWidget {
  const AppFieldsStatesStory({super.key});

  @override
  Widget build(BuildContext context) {
    return StateStoryCenter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const AppEmailField(),
          const SizedBox(height: AppSpacing.md),
          const AppPasswordField(),
          const SizedBox(height: AppSpacing.md),
          AppEmailField(
            readOnly: true,
            controller: TextEditingController(text: 'contato@email.com'),
          ),
          const SizedBox(height: AppSpacing.md),
          AppPasswordField(
            enabled: false,
            controller: TextEditingController(text: '123456'),
          ),
          const SizedBox(height: AppSpacing.md),
          ErrorFieldDemo(
            child: AppEmailField(
              controller: TextEditingController(text: 'email-invalido'),
              validator: (_) => 'Informe um e-mail válido',
            ),
          ),
        ],
      ),
    );
  }
}