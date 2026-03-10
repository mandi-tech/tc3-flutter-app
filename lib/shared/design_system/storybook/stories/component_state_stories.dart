import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../../../features/navigation/domain/navigation_tab.dart';
import '../../../../features/navigation/presentation/widgets/main_navigation_bar.dart';
import '../../../utils/theme_extensions.dart';
import '../../components/app_button.dart';
import '../../components/app_email_field.dart';
import '../../components/app_password_field.dart';
import '../../tokens/app_spacing.dart';
import '../../tokens/app_typography.dart';

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
  Story(
    name: 'States/MainNavigationBar',
    description: 'Estados visuais da navbar com cada aba selecionada.',
    builder: (_) => const _MainNavigationBarStatesStory(),
  ),
  Story(
    name: 'States/Login Form - Error',
    description: 'Estado de erro do formulário de login.',
    builder: (_) => const _LoginFormErrorStateStory(),
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

class _MainNavigationBarStatesStory extends StatelessWidget {
  const _MainNavigationBarStatesStory();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (final tab in NavigationTab.values) ...[
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: MainNavigationBar(
                currentTab: tab,
                onTabSelected: (_) {},
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
          ],
        ],
      ),
    );
  }
}

class _LoginFormErrorStateStory extends StatelessWidget {
  const _LoginFormErrorStateStory();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 380),
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: context.colors.surface,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: context.colors.outlineVariant,
            ),
          ),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppEmailField(
                  controller: TextEditingController(text: 'email-invalido'),
                  validator: (_) => 'Informe um e-mail válido',
                ),
                const SizedBox(height: AppSpacing.md),
                AppPasswordField(
                  controller: TextEditingController(text: '123'),
                  validator: (_) => 'E-mail ou senha incorretos.',
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'E-mail ou senha incorretos.',
                  style: AppTypography.caption.copyWith(
                    color: context.colors.error,
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                const AppButton(
                  label: 'Entrar',
                  onPressed: null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _noop() {}