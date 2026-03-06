import 'package:flutter/material.dart';

import '../tokens/app_colors.dart';
import 'app_text_field.dart';

class AppEmailField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final bool enabled;
  final bool readOnly;

  const AppEmailField({
    super.key,
    this.controller,
    this.textInputAction,
    this.validator,
    this.onFieldSubmitted,
    this.onChanged,
    this.enabled = true,
    this.readOnly = false,
  });

  String? _defaultValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Informe seu e-mail';
    }

    final emailRegex = RegExp(
      r'^[\w\.-]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    if (!emailRegex.hasMatch(value.trim())) {
      return 'Informe um e-mail válido';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      label: 'E-mail',
      hintText: 'Digite seu e-mail',
      keyboardType: TextInputType.emailAddress,
      textInputAction: textInputAction,
      enabled: enabled,
      readOnly: readOnly,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator ?? _defaultValidator,
      prefixIcon: const Icon(
        Icons.mail_outline_rounded,
        color: AppColors.secondary,
      ),
    );
  }
}