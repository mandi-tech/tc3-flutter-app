import 'package:flutter/material.dart';
import '../../../../../../../../features/register/presentation/widgets/register_form.dart';
import '../../../../../tokens/app_spacing.dart';
import '../../../../stories/widgets/story_preview_frame.dart';

class RegisterFormPreview extends StatelessWidget {

  const RegisterFormPreview({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return StoryPreviewFrame(
      width: 390,
      title: 'Register Form',
      // Agora o formulário vai scrollar dentro do frame de 700px!
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: const RegisterForm(),
      ),
    );
  }
}