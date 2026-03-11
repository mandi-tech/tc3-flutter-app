import 'package:flutter/material.dart';

import '../../../widgets/story_preview_frame.dart';

class FormStoryShell extends StatelessWidget {
  final String title;
  final Widget child;

  const FormStoryShell({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return StoryPreviewFrame(
      width: 380,
      title: title,
      child: child,
    );
  }
}