import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../data/services/auth_service.dart';

class AuthController extends ChangeNotifier {
  final AuthService _authService;

  AuthController(this._authService) {
    _subscription = _authService.authStateChanges.listen((user) {
      _user = user;
      notifyListeners();
    });
  }

  StreamSubscription<User?>? _subscription;

  User? _user;
  bool _isLoading = false;
  String? _errorMessage;

  User? get user => _user;
  bool get isAuthenticated => _user != null;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  String get displayName => _user?.displayName ?? 'Usuário';
  String get email => _user?.email ?? '-';

  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    try {
      _setLoading(true);
      _clearError();

      await _authService.signIn(
        email: email,
        password: password,
      );

      return true;
    } on FirebaseAuthException catch (e) {
      _errorMessage = _mapFirebaseError(e);
      notifyListeners();
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      _setLoading(true);
      _clearError();

      await _authService.signUp(
        email: email,
        password: password,
      );

      await _authService.updateDisplayName(fullName);
      await _authService.reloadUser();
      _user = _authService.currentUser;
      notifyListeners();

      return true;
    } on FirebaseAuthException catch (e) {
      _errorMessage = _mapFirebaseError(e);
      notifyListeners();
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> changePassword({
    required String newPassword,
  }) async {
    try {
      _setLoading(true);
      _clearError();

      await _authService.updatePassword(newPassword);

      return true;
    } on FirebaseAuthException catch (e) {
      _errorMessage = _mapPasswordError(e);
      notifyListeners();
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _clearError() {
    _errorMessage = null;
  }

  String _mapFirebaseError(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'E-mail inválido.';
      case 'wrong-password':
        return 'Senha incorreta.';
      case 'user-not-found':
      case 'invalid-credential':
        return 'Credenciais inválidas ou desconhecidas.';
      case 'email-already-in-use':
        return 'Este e-mail já está em uso.';
      case 'weak-password':
        return 'A senha é muito fraca.';
      default:
        return 'Não foi possível concluir a autenticação.';
    }
  }

  String _mapPasswordError(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return 'A nova senha é muito fraca.';
      case 'requires-recent-login':
        return 'Por segurança, entre novamente antes de alterar a senha.';
      default:
        return 'Não foi possível alterar a senha.';
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}