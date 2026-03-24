import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../shared/design_system/components/app_button.dart';
import '../../../../shared/design_system/components/app_password_field.dart';
import '../../../../shared/design_system/tokens/app_spacing.dart';
import '../../../../shared/design_system/tokens/app_typography.dart';
import '../../../../shared/utils/theme_extensions.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleChangePassword() async {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) return;

    final authController = context.read<AuthController>();

    final success = await authController.changePassword(
      newPassword: _newPasswordController.text,
    );

    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Senha alterada com sucesso.'),
        ),
      );
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            authController.errorMessage ?? 'Erro ao alterar senha.',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authController = context.watch<AuthController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Alterar senha'),
      ),
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          Text(
            'Defina uma nova senha para sua conta.',
            style: AppTypography.body.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Container(
            padding: const EdgeInsets.all(AppSpacing.lg),
            decoration: BoxDecoration(
              color: context.colors.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: context.colors.outlineVariant,
              ),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  AppPasswordField(
                    controller: _newPasswordController,
                    label: 'Nova senha',
                    hintText: 'Digite sua nova senha',
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Informe a nova senha';
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
                    label: 'Confirmar nova senha',
                    hintText: 'Digite novamente a nova senha',
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) => _handleChangePassword(),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Confirme a nova senha';
                      }
                      if (value != _newPasswordController.text) {
                        return 'As senhas não coincidem';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  AppButton(
                    label: 'Salvar nova senha',
                    onPressed: _handleChangePassword,
                    isLoading: authController.isLoading,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}