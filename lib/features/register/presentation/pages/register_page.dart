import 'package:flutter/material.dart';

import '../widgets/register_header.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RegisterHeader(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}