import 'package:flutter/material.dart';
import '../../../../../../../features/auth/presentation/widgets/login_header.dart';

class LoginHeaderPreview extends StatelessWidget {
  const LoginHeaderPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: LoginHeader(),
        ),
      ),
    );
  }
}