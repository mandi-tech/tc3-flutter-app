import 'package:flutter/material.dart';

class StateStoryCenter extends StatelessWidget {
  final Widget child;
  final double maxWidth;

  const StateStoryCenter({
    super.key,
    required this.child,
    this.maxWidth = 360,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}