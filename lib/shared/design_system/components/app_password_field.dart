import 'package:flutter/material.dart';

import '../../utils/theme_extensions.dart';
import 'app_text_field.dart';

class AppPasswordField extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final bool enabled;
  final bool readOnly;

  const AppPasswordField({
    super.key,
    this.label = 'Senha',
    this.hintText = 'Digite sua senha',
    this.controller,
    this.textInputAction,
    this.validator,
    this.onFieldSubmitted,
    this.onChanged,
    this.enabled = true,
    this.readOnly = false,
  });

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool _obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: widget.controller,
      label: widget.label,
      hintText: widget.hintText,
      textInputAction: widget.textInputAction,
      obscureText: _obscurePassword,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      onChanged: widget.onChanged,
      prefixIcon: Icon(
        Icons.lock_outline_rounded,
        color: context.colors.secondary,
      ),
      suffixIcon: IconButton(
        onPressed: _togglePasswordVisibility,
        icon: Icon(
          _obscurePassword
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          color: context.colors.secondary,
        ),
      ),
    );
  }
}