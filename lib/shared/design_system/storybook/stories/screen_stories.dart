import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../../../features/navigation/domain/navigation_tab.dart';
import '../../../../features/navigation/presentation/widgets/main_navigation_bar.dart';
import '../../../utils/theme_extensions.dart';
import '../../components/app_button.dart';
import '../../components/app_email_field.dart';
import '../../components/app_password_field.dart';
import '../../components/app_text_field.dart';
import '../../tokens/app_colors.dart';
import '../../tokens/app_spacing.dart';
import '../../tokens/app_typography.dart';
import '../widgets/story_preview_frame.dart';

final List<Story> screenStories = [
  Story(
    name: 'Screens/Login Screen',
    description: 'Tela completa de login.',
    builder: (_) => const StoryPreviewFrame(
      width: 380,
      title: 'Login Screen',
      child: _LoginScreenPreview(),
    ),
  ),
  Story(
    name: 'Screens/Login Screen Responsive',
    description: 'Tela completa de login em larguras diferentes.',
    builder: (_) => SingleChildScrollView(
      child: Column(
        children: const [
          StoryPreviewFrame(
            width: 320,
            title: 'Mobile Small',
            child: _LoginScreenPreview(),
          ),
          SizedBox(height: AppSpacing.xl),
          StoryPreviewFrame(
            width: 390,
            title: 'Mobile Large',
            child: _LoginScreenPreview(),
          ),
          SizedBox(height: AppSpacing.xl),
          StoryPreviewFrame(
            width: 600,
            title: 'Tablet',
            child: _LoginScreenPreview(),
          ),
        ],
      ),
    ),
  ),
  Story(
    name: 'Screens/Register Screen',
    description: 'Tela completa de cadastro.',
    builder: (_) => const StoryPreviewFrame(
      width: 380,
      title: 'Register Screen',
      child: _RegisterScreenPreview(),
    ),
  ),
  Story(
    name: 'Screens/Register Screen Responsive',
    description: 'Tela completa de cadastro em larguras diferentes.',
    builder: (_) => SingleChildScrollView(
      child: Column(
        children: const [
          StoryPreviewFrame(
            width: 320,
            title: 'Mobile Small',
            child: _RegisterScreenPreview(),
          ),
          SizedBox(height: AppSpacing.xl),
          StoryPreviewFrame(
            width: 390,
            title: 'Mobile Large',
            child: _RegisterScreenPreview(),
          ),
          SizedBox(height: AppSpacing.xl),
          StoryPreviewFrame(
            width: 600,
            title: 'Tablet',
            child: _RegisterScreenPreview(),
          ),
        ],
      ),
    ),
  ),
  Story(
    name: 'Screens/Main Navigation Screen',
    description: 'Prévia da tela principal com conteúdo e navbar.',
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

      return StoryPreviewFrame(
        width: 390,
        title: 'Main Navigation',
        child: _MainNavigationScreenPreview(
          selectedTab: selectedTab,
        ),
      );
    },
  ),
  Story(
    name: 'Screens/Account Screen',
    description: 'Tela de dados da conta.',
    builder: (_) => const StoryPreviewFrame(
      width: 390,
      title: 'Account Screen',
      child: _AccountScreenPreview(),
    ),
  ),
  Story(
    name: 'Screens/Profile Screen',
    description: 'Tela principal de perfil.',
    builder: (_) => const StoryPreviewFrame(
      width: 390,
      title: 'Profile Screen',
      child: _ProfileScreenPreview(),
    ),
  ),
];

class _LoginScreenPreview extends StatelessWidget {
  const _LoginScreenPreview();

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _AuthHeaderPreview(
          title: 'Bem-vinda!',
          description: 'Entre com seu e-mail e senha para continuar',
        ),
        SizedBox(height: AppSpacing.xl),
        _LoginFormOnly(),
      ],
    );
  }
}

class _RegisterScreenPreview extends StatelessWidget {
  const _RegisterScreenPreview();

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _AuthHeaderPreview(
          title: 'Crie sua conta',
          description: 'Comece a organizar sua vida financeira em poucos passos',
        ),
        SizedBox(height: AppSpacing.xl),
        _RegisterFormOnly(),
      ],
    );
  }
}

class _AuthHeaderPreview extends StatelessWidget {
  final String title;
  final String description;

  const _AuthHeaderPreview({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.xl,
        horizontal: AppSpacing.lg,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withOpacity(0.18),
            AppColors.primary.withOpacity(0.08),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: AppTypography.title.copyWith(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: context.colors.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            description,
            style: AppTypography.body.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _LoginFormOnly extends StatelessWidget {
  const _LoginFormOnly();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AppEmailField(),
        SizedBox(height: AppSpacing.md),
        AppPasswordField(),
        SizedBox(height: AppSpacing.lg),
        AppButton(
          label: 'Entrar',
          onPressed: null,
        ),
      ],
    );
  }
}

class _RegisterFormOnly extends StatelessWidget {
  const _RegisterFormOnly();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          label: 'Nome completo',
          hintText: 'Digite seu nome completo',
          prefixIcon: Icon(
            Icons.person_outline_rounded,
            color: context.colors.secondary,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        const AppEmailField(),
        const SizedBox(height: AppSpacing.md),
        const AppPasswordField(),
        const SizedBox(height: AppSpacing.md),
        const AppPasswordField(
          label: 'Confirmar senha',
          hintText: 'Digite sua senha novamente',
        ),
        const SizedBox(height: AppSpacing.lg),
        const AppButton(
          label: 'Criar conta',
          onPressed: null,
        ),
      ],
    );
  }
}

class _MainNavigationScreenPreview extends StatelessWidget {
  final NavigationTab selectedTab;

  const _MainNavigationScreenPreview({
    required this.selectedTab,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 640,
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: context.theme.scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: context.colors.outlineVariant,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                _titleForTab(selectedTab),
                style: AppTypography.title.copyWith(
                  color: context.colors.onSurface,
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          MainNavigationBar(
            currentTab: selectedTab,
            onTabSelected: (_) {},
          ),
        ],
      ),
    );
  }

  String _titleForTab(NavigationTab tab) {
    switch (tab) {
      case NavigationTab.home:
        return 'Home';
      case NavigationTab.transactions:
        return 'Extrato';
      case NavigationTab.add:
        return 'Adicionar transação';
      case NavigationTab.cards:
        return 'Cartões';
      case NavigationTab.profile:
        return 'Perfil';
    }
  }
}

class _AccountScreenPreview extends StatelessWidget {
  const _AccountScreenPreview();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Dados da conta',
            style: AppTypography.title.copyWith(
              color: context.colors.onSurface,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: context.colors.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: context.colors.outlineVariant,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nome',
                style: AppTypography.caption.copyWith(
                  color: context.colors.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Isabelle Ribeiro',
                style: AppTypography.body.copyWith(
                  color: context.colors.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                'E-mail',
                style: AppTypography.caption.copyWith(
                  color: context.colors.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'isabelle@email.com',
                style: AppTypography.body.copyWith(
                  color: context.colors.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          decoration: BoxDecoration(
            color: context.colors.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: context.colors.outlineVariant,
            ),
          ),
          child: ListTile(
            leading: const Icon(
              Icons.lock_outline_rounded,
              color: AppColors.secondary,
            ),
            title: Text(
              'Alterar senha',
              style: AppTypography.body.copyWith(
                color: context.colors.onSurface,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}

class _ProfileScreenPreview extends StatelessWidget {
  const _ProfileScreenPreview();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Perfil',
          style: AppTypography.title.copyWith(
            color: context.colors.onSurface,
          ),
        ),
        const SizedBox(height: AppSpacing.lg),

        Text(
          'Conta',
          style: AppTypography.title.copyWith(
            color: context.colors.onSurface,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        _SettingsCardPreview(
          child: ListTile(
            leading: const Icon(Icons.person_outline_rounded),
            title: Text(
              'Dados da conta',
              style: AppTypography.body.copyWith(
                color: context.colors.onSurface,
              ),
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () {},
          ),
        ),

        const SizedBox(height: AppSpacing.xl),

        Text(
          'Preferências',
          style: AppTypography.title.copyWith(
            color: context.colors.onSurface,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        _SettingsCardPreview(
          child: ListTile(
            leading: const Icon(Icons.palette_outlined),
            title: Text(
              'Tema',
              style: AppTypography.body.copyWith(
                color: context.colors.onSurface,
              ),
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () {},
          ),
        ),

        const SizedBox(height: AppSpacing.xl),

        _SettingsCardPreview(
          child: ListTile(
            leading: Icon(
              Icons.logout_rounded,
              color: context.colors.error,
            ),
            title: Text(
              'Sair',
              style: AppTypography.body.copyWith(
                color: context.colors.error,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}

class _SettingsCardPreview extends StatelessWidget {
  final Widget child;

  const _SettingsCardPreview({
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