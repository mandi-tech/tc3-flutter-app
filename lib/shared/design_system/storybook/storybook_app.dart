import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tc3_flutter_app/shared/design_system/storybook/stories/all_stories.dart';

import '../../utils/theme_extensions.dart';
import '../themes/app_theme.dart';
import '../tokens/app_spacing.dart';

class StorybookApp extends StatelessWidget {
  const StorybookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Storybook(
      wrapperBuilder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(),
          home: Scaffold(
            backgroundColor: context.theme.scaffoldBackgroundColor,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: child,
              ),
            ),
          ),
        );
      },
      stories: [
        ...allStories
      ],
    );
  }
}