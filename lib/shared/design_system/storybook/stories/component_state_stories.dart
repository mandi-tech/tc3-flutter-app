import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../components/app_button.dart';
import '../../components/app_email_field.dart';
import '../../components/app_password_field.dart';
import '../../tokens/app_spacing.dart';

final List<Story> componentStateStories = [
  Story(
    name: 'States/AppButton',
    description: 'Estados visuais do AppButton.',
    builder: (_) => const _AppButtonStatesStory(),
  ),
  Story(
    name: 'States/AppFields',
    description: 'Estados visuais dos campos.',
    builder: (_) => const _AppFieldsStatesStory(),
  ),
];

class _AppButtonStatesStory extends StatelessWidget {
  const _AppButtonStatesStory();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 360),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            AppButton(
              label: 'Primary',
              onPressed: _noop,
            ),
            SizedBox(height: AppSpacing.md),
            AppButton(
              label: 'Secondary',
              variant: AppButtonVariant.secondary,
              onPressed: _noop,
            ),
            SizedBox(height: AppSpacing.md),
            AppButton(
              label: 'Danger',
              variant: AppButtonVariant.danger,
              onPressed: _noop,
            ),
            SizedBox(height: AppSpacing.md),
            AppButton(
              label: 'Loading',
              isLoading: true,
              onPressed: _noop,
            ),
            SizedBox(height: AppSpacing.md),
            AppButton(
              label: 'Disabled',
              enabled: false,
              onPressed: _noop,
            ),
          ],
        ),
      ),
    );
  }
}

class _AppFieldsStatesStory extends StatelessWidget {
  const _AppFieldsStatesStory();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 360),
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
            _ErrorFieldDemo(
              child: AppEmailField(
                controller: TextEditingController(text: 'email-invalido'),
                validator: (_) => 'Informe um e-mail válido',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorFieldDemo extends StatefulWidget {
  final Widget child;

  const _ErrorFieldDemo({
    required this.child,
  });

  @override
  State<_ErrorFieldDemo> createState() => _ErrorFieldDemoState();
}

class _ErrorFieldDemoState extends State<_ErrorFieldDemo> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _formKey.currentState?.validate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: widget.child,
    );
  }
}

void _noop() {}