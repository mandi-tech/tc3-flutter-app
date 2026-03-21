// lib/shared/design_system/storybook/previews/features/auth/login_screen_preview.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../features/auth/presentation/controllers/auth_controller.dart';
import '../../../../../../features/auth/presentation/widgets/login_form.dart';
import '../../../../../utils/theme_extensions.dart';
import '../../../../tokens/app_spacing.dart';
import '../../../support/mocks/features/auth/auth_controller_mock.dart';
import 'widgets/auth_header_preview.dart';

class LoginScreenPreview extends StatelessWidget {
  final bool isLoading;

  const LoginScreenPreview({super.key, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    final mockAuth = MockAuthController();
    when(() => mockAuth.isLoading).thenReturn(isLoading);

    return ChangeNotifierProvider<AuthController>.value(
      value: mockAuth,
      child: Scaffold(
        backgroundColor: context.colors.surface,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            children: [
              const AuthHeaderPreview(
                title: 'Bem-vinda!',
                description: 'Entre com seu e-mail e senha para continuar',
              ),
              const SizedBox(height: AppSpacing.xl),
              const LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}