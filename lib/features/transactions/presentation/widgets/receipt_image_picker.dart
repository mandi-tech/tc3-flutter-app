import 'dart:io' show File;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../shared/design_system/components/app_button.dart';
import '../../../../shared/design_system/components/app_card.dart';
import '../../../../shared/design_system/tokens/app_spacing.dart';
import '../../../../shared/design_system/tokens/app_typography.dart';

class ReceiptImagePicker extends StatelessWidget {
  final XFile? image;
  final Future<void> Function() onPickFromGallery;
  final Future<void> Function() onTakePhoto;
  final VoidCallback onRemove;

  const ReceiptImagePicker({
    super.key,
    required this.image,
    required this.onPickFromGallery,
    required this.onTakePhoto,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    Widget preview;

    if (image == null) {
      preview = const Column(
        children: [
          Icon(Icons.receipt_long_outlined, size: 40),
          SizedBox(height: AppSpacing.sm),
          Text(
            'Nenhuma nota fiscal selecionada',
            style: AppTypography.body,
            textAlign: TextAlign.center,
          ),
        ],
      );
    } else {
      preview = ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: kIsWeb
            ? Image.network(
                image!.path,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              )
            : Image.file(
                File(image!.path),
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Nota fiscal (opcional)',
          style: AppTypography.body,
        ),
        const SizedBox(height: AppSpacing.sm),
        AppCard(
          child: preview,
        ),
        const SizedBox(height: AppSpacing.sm),
        Row(
          children: [
            Expanded(
              child: AppButton(
                label: 'Galeria',
                onPressed: onPickFromGallery,
                variant: AppButtonVariant.secondary,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: AppButton(
                label: 'Câmera',
                onPressed: onTakePhoto,
                variant: AppButtonVariant.secondary,
              ),
            ),
          ],
        ),
        if (image != null) ...[
          const SizedBox(height: AppSpacing.sm),
          AppButton(
            label: 'Remover imagem',
            onPressed: onRemove,
            variant: AppButtonVariant.danger,
          ),
        ],
      ],
    );
  }
}