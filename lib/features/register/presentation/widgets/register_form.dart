import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../shared/design_system/components/app_button.dart';
import '../../../../shared/design_system/components/app_email_field.dart';
import '../../../../shared/design_system/components/app_password_field.dart';
import '../../../../shared/design_system/components/app_text_field.dart';
import '../../../../shared/design_system/tokens/app_colors.dart';
import '../../../../shared/design_system/tokens/app_spacing.dart';
import '../../../../shared/utils/navigation_extensions.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleRegister() async {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) return;

    final authController = context.read<AuthController>();

    final success = await authController.signUp(
      fullName: _fullNameController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (!mounted) return;

    if (success) {
      context.goPage(AppRoutes.main);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            authController.errorMessage ?? 'Erro ao criar conta.',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.neutral100,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondary.withOpacity(0.08),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppTextField(
              controller: _fullNameController,
              textInputAction: TextInputAction.next,
              label: 'Nome completo',
              hintText: 'Digite seu nome completo',
              prefixIcon: const Icon(
                Icons.person_outline_rounded,
                color: AppColors.secondary,
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Informe seu nome completo';
                }
                if (value.trim().split(' ').length < 2) {
                  return 'Informe nome e sobrenome';
                }
                return null;
              },
            ),
            const SizedBox(height: AppSpacing.md),
            AppEmailField(
              controller: _emailController,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: AppSpacing.md),
            AppPasswordField(
              controller: _passwordController,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Informe sua senha';
                }
                if (value.trim().length < 6) {
                  return 'A senha deve ter pelo menos 6 caracteres';
                }
                return null;
              },
            ),
            const SizedBox(height: AppSpacing.md),
            AppPasswordField(
              controller: _confirmPasswordController,
              label: 'Confirmar senha',
              hintText: 'Digite sua senha novamente',
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => _handleRegister(),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Confirme sua senha';
                }
                if (value != _passwordController.text) {
                  return 'As senhas não coincidem';
                }
                return null;
              },
            ),
            const SizedBox(height: AppSpacing.lg),
            Consumer<AuthController>(
              builder: (context, authController, _) {
                return AppButton(
                  label: 'Criar conta',
                  onPressed: _handleRegister,
                  isLoading: authController.isLoading,
                );
              },
            ),
            const SizedBox(height: AppSpacing.sm),
            TextButton(
              onPressed: () => context.goBack(),
              child: const Text(
                'Já tenho conta',
                style: TextStyle(
                  color: AppColors.secondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}