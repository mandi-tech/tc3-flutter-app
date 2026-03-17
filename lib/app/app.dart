import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import '../features/auth/presentation/controllers/auth_controller.dart';
import '../features/auth/data/services/auth_service.dart';
import '../features/transactions/di/transaction_providers.dart';
import '../features/transactions/presentation/controllers/transaction_filter_controller.dart';
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
      child: MultiProvider(
        providers: [
          Provider<AuthService>(
            create: (_) => AuthService(),
          ),
          ChangeNotifierProvider<AuthController>(
            create: (context) => AuthController(
              context.read<AuthService>(),
            ),
          ),
          ChangeNotifierProvider<AuthController>(
            create: (context) => AuthController(
              context.read<AuthService>(),
            ),
          ),
          ChangeNotifierProvider(
            create: (_) => TransactionFilterController(),
          ),
          ...transactionProviders,
        ],
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
              locale: const Locale('pt', 'BR'),
              supportedLocales: const [
                Locale('pt', 'BR'),
                Locale('en', 'US'),
              ],
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
            );
          },
        ),
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