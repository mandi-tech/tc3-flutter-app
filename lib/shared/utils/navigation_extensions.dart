import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension NavigationExtension on BuildContext {
  // Empilha página sem remover a anterior
  Future<T?> pushPage<T extends Object?>(
    String route, {
    Object? extra,
  }) {
    return push<T>(route, extra: extra);
  }

  // Substitui a página atual pela nova, sem permitir voltar
  void goPage(
    String route, {
    Object? extra,
  }) {
    go(route, extra: extra);
  }

  // Substitui a página atual pela nova, permitindo voltar para a anterior
  void replacePage(
    String route, {
    Object? extra,
  }) {
    replace(route, extra: extra);
  }

  // Volta para a página anterior, se possível
  void goBack<T extends Object?>([T? result]) {
    if (canPop()) {
      pop(result);
    }
  }

  // Volta para a página raiz, removendo todas as páginas anteriores
  void popUntilRoot() {
    while (canPop()) {
      pop();
    }
  }

  // Abre um diálogo modal
  Future<T?> openAppDialog<T>({
    required Widget child,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: this,
      barrierDismissible: barrierDismissible,
      builder: (_) => child,
    );
  }

  // Abre um bottom sheet modal
  Future<T?> openAppBottomSheet<T>({
    required Widget child,
    bool isScrollControlled = false,
  }) {
    return showModalBottomSheet<T>(
      context: this,
      isScrollControlled: isScrollControlled,
      builder: (_) => child,
    );
  }

  //  Exibe um SnackBar com mensagem personalizada
  void showAppSnackBar(
    String message, {
    SnackBarAction? action,
    Duration duration = const Duration(seconds: 2),
  }) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          duration: duration,
          action: action,
        ),
      );
  }
}