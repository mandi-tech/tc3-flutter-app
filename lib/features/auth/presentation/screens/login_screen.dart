import 'package:flutter/material.dart';

import '../../../../shared/utils/theme_extensions.dart';
import '../widgets/login_form.dart';
import '../widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LoginHeader(),
                  SizedBox(height: 24),
                  LoginForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}