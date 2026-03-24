import 'package:flutter/material.dart';
import '../../../../shared/design_system/components/app_button.dart';
import '../../../../shared/design_system/components/app_password_field.dart';
import '../../../../shared/design_system/tokens/app_spacing.dart';

class ChangePasswordForm extends StatefulWidget {
  final VoidCallback? onSave;
  final bool isLoading;

  const ChangePasswordForm({
    super.key, 
    this.onSave, 
    this.isLoading = false,
  });

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      widget.onSave?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppPasswordField(
            controller: _passwordController,
            label: 'Nova senha',
            hintText: 'Digite sua nova senha',
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Informe a nova senha';
              if (value.length < 6) return 'Mínimo de 6 caracteres';
              return null;
            },
          ),
          const SizedBox(height: AppSpacing.md),
          AppPasswordField(
            controller: _confirmPasswordController,
            label: 'Confirmar nova senha',
            hintText: 'Repita a nova senha',
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => _submit(),
            validator: (value) {
              if (value != _passwordController.text) return 'As senhas não coincidem';
              return null;
            },
          ),
          const SizedBox(height: AppSpacing.lg),
          AppButton(
            label: 'Salvar nova senha',
            isLoading: widget.isLoading,
            onPressed: _submit,
          ),
        ],
      ),
    );
  }
}