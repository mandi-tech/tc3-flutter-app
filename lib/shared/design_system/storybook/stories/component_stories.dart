import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../../../features/navigation/domain/navigation_tab.dart';
import '../../../../features/navigation/presentation/widgets/main_navigation_bar.dart';
import '../../components/app_button.dart';
import '../../components/app_email_field.dart';
import '../../components/app_password_field.dart';
import '../../components/app_text_field.dart';
import '../../tokens/app_colors.dart';

final List<Story> componentStories = [
  Story(
    name: 'Components/AppButton',
    description: 'Botão do Design System com variações e estados.',
    builder: (context) {
      final label = context.knobs.text(
        label: 'Label',
        initial: 'Salvar',
      );
      final enabled = context.knobs.boolean(
        label: 'Enabled',
        initial: true,
      );
      final isLoading = context.knobs.boolean(
        label: 'Loading',
        initial: false,
      );
      final variant = context.knobs.options<AppButtonVariant>(
        label: 'Variant',
        initial: AppButtonVariant.primary,
        options: const [
          Option(label: 'Primary', value: AppButtonVariant.primary),
          Option(label: 'Secondary', value: AppButtonVariant.secondary),
          Option(label: 'Danger', value: AppButtonVariant.danger),
        ],
      );

      return Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 320),
          child: AppButton(
            label: label,
            enabled: enabled,
            isLoading: isLoading,
            variant: variant,
            onPressed: enabled && !isLoading ? () {} : null,
          ),
        ),
      );
    },
  ),
  Story(
    name: 'Components/AppTextField',
    description: 'Campo de texto base do Design System.',
    builder: (context) {
      final label = context.knobs.text(
        label: 'Label',
        initial: 'Nome',
      );
      final hint = context.knobs.text(
        label: 'Hint',
        initial: 'Digite seu nome',
      );
      final enabled = context.knobs.boolean(
        label: 'Enabled',
        initial: true,
      );
      final readOnly = context.knobs.boolean(
        label: 'Read only',
        initial: false,
      );

      return Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 360),
          child: AppTextField(
            label: label,
            hintText: hint,
            enabled: enabled,
            readOnly: readOnly,
            prefixIcon: const Icon(
              Icons.person_outline_rounded,
              color: AppColors.secondary,
            ),
          ),
        ),
      );
    },
  ),
  Story(
    name: 'Components/AppEmailField',
    description: 'Campo de e-mail padronizado.',
    builder: (context) {
      final enabled = context.knobs.boolean(
        label: 'Enabled',
        initial: true,
      );
      final readOnly = context.knobs.boolean(
        label: 'Read only',
        initial: false,
      );

      return Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 360),
          child: AppEmailField(
            enabled: enabled,
            readOnly: readOnly,
          ),
        ),
      );
    },
  ),
  Story(
    name: 'Components/AppPasswordField',
    description: 'Campo de senha com mostrar/ocultar.',
    builder: (context) {
      final enabled = context.knobs.boolean(
        label: 'Enabled',
        initial: true,
      );
      final readOnly = context.knobs.boolean(
        label: 'Read only',
        initial: false,
      );

      return Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 360),
          child: AppPasswordField(
            enabled: enabled,
            readOnly: readOnly,
          ),
        ),
      );
    },
  ),
  Story(
    name: 'Components/MainNavigationBar',
    description: 'Barra principal de navegação do app.',
    builder: (context) {
      final selectedTab = context.knobs.options<NavigationTab>(
        label: 'Selected tab',
        initial: NavigationTab.home,
        options: const [
          Option(label: 'Home', value: NavigationTab.home),
          Option(label: 'Extrato', value: NavigationTab.transactions),
          Option(label: 'Adicionar', value: NavigationTab.add),
          Option(label: 'Cartões', value: NavigationTab.cards),
          Option(label: 'Perfil', value: NavigationTab.profile),
        ],
      );

      return Align(
        alignment: Alignment.bottomCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: MainNavigationBar(
            currentTab: selectedTab,
            onTabSelected: (_) {},
          ),
        ),
      );
    },
  ),
];