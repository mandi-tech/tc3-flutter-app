import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../features/auth/presentation/controllers/auth_controller.dart';
import '../../../../../../features/profile/presentation/screens/change_password_screen.dart';
import '../../../support/mocks/features/auth/auth_controller_mock.dart';

class ChangePasswordScreenPreview extends StatelessWidget {
  final bool isLoading;

  const ChangePasswordScreenPreview({
    super.key, 
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final mockAuth = MockAuthController();

    when(() => mockAuth.isLoading).thenReturn(isLoading);

    return ChangeNotifierProvider<AuthController>.value(
      value: mockAuth,
      child: const ChangePasswordScreen(),
    );
  }
}