import 'package:flutter/material.dart';

class ErrorFieldDemo extends StatefulWidget {
  final Widget child;

  const ErrorFieldDemo({
    super.key,
    required this.child,
  });

  @override
  State<ErrorFieldDemo> createState() => _ErrorFieldDemoState();
}

class _ErrorFieldDemoState extends State<ErrorFieldDemo> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _formKey.currentState?.validate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: widget.child,
    );
  }
}