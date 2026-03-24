import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../../../../features/auth/presentation/controllers/auth_controller.dart';
import '../../../../../../../features/register/presentation/widgets/register_form.dart';
import '../../../../stories/widgets/story_preview_frame.dart';
import '../../../../support/mocks/features/auth/auth_controller_mock.dart';

class RegisterFormPreview extends StatelessWidget {
  final bool isLoading;

  const RegisterFormPreview({super.key, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    final mockAuth = MockAuthController();
    when(() => mockAuth.isLoading).thenReturn(isLoading);

    return StoryPreviewFrame(
      width: 380,
      title: 'Register Screen',
      child: ChangeNotifierProvider<AuthController>.value(
        value: mockAuth,
        child: Scaffold(
          backgroundColor: const Color(0xFFFDF7FB), 
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: const RegisterForm(),
          ),
        ),
      ),
    );
  }
}