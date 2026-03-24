import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../features/auth/presentation/controllers/auth_controller.dart';
import '../../../../../../features/register/presentation/widgets/register_form.dart';
import '../../../../../utils/theme_extensions.dart';
import '../../../../tokens/app_spacing.dart';
import '../../../support/mocks/features/auth/auth_controller_mock.dart';

class RegisterScreenPreview extends StatelessWidget {
  final bool isLoading;

  const RegisterScreenPreview({super.key, this.isLoading = false});

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
              
              const SizedBox(height: AppSpacing.xl),
              const RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}