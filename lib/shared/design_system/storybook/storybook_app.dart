import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../utils/theme_extensions.dart';
import '../themes/app_theme.dart';
import '../tokens/app_spacing.dart';
import 'stories/states/component_state_stories.dart';
import 'stories/components/components_stories.dart';
import 'stories/forms/form_stories.dart';
import 'stories/screens/screen_stories.dart';
import 'stories/tokens/token_stories.dart';
import 'stories/transactions/transaction_stories.dart';

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
        ...componentStories,
        ...transactionStories,
        ...componentStateStories,
        ...formStories,
        ...screenStories,
        ...tokenStories,
      ],
    );
  }
}