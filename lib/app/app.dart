import 'package:flutter/material.dart';

import '../shared/design_system/themes/app_theme.dart';
import 'controllers/theme_controller.dart';
import 'router/app_router.dart';

class App extends StatefulWidget {
  const App({super.key});

  static ThemeController of(BuildContext context) {
    final inherited = context
        .dependOnInheritedWidgetOfExactType<_ThemeControllerProvider>();

    assert(
      inherited != null,
      'ThemeController não encontrado no contexto.',
    );

    return inherited!.controller;
  }

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final ThemeController _themeController = ThemeController();

  @override
  Widget build(BuildContext context) {
    return _ThemeControllerProvider(
      controller: _themeController,
      child: AnimatedBuilder(
        animation: _themeController,
        builder: (context, _) {
          return MaterialApp.router(
            title: 'Gerenciador Financeiro',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            themeMode: _themeController.flutterThemeMode,
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}

class _ThemeControllerProvider extends InheritedWidget {
  final ThemeController controller;

  const _ThemeControllerProvider({
    required this.controller,
    required super.child,
  });

  @override
  bool updateShouldNotify(_ThemeControllerProvider oldWidget) {
    return controller != oldWidget.controller;
  }
}