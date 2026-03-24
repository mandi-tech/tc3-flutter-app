import 'package:flutter/material.dart';
import '../../../../../../../features/profile/presentation/widgets/change_password_form.dart';
import '../../../../stories/widgets/surface_preview.dart';

class ChangePasswordFormPreview extends StatelessWidget {
  final bool isLoading;

  const ChangePasswordFormPreview({super.key, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return SurfacePreview(
      child: ChangePasswordForm(
        isLoading: isLoading,
        onSave: () {
          debugPrint("Senha alterada com sucesso!");
        },
      ),
    );
  }
}