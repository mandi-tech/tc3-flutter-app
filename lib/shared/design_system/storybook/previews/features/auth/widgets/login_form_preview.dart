import 'package:flutter/material.dart';
import '../../../../../../../features/auth/presentation/widgets/login_form.dart';
import '../../../../stories/widgets/surface_preview.dart';

class LoginFormPreview extends StatelessWidget {
  const LoginFormPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return const SurfacePreview(
      child: LoginForm(),
    );
  }
}