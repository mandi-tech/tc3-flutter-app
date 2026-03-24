import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../../../features/auth/data/services/auth_service.dart';
import '../../../components/app_tob_bar.dart';

/// Criamos os Mocks necessários
class MockAuthService extends Mock implements AuthService {}
class MockUser extends Mock implements User {}

final List<Story> appTopBarStories = [
  Story(
    name: 'Components/AppTopBar',
    builder: (context) {
      /// Knobs para testar diferentes estados visuais
      final mockName = context.knobs.text(
        label: 'Nome no Firebase', 
        initial: 'Isabelle Ribeiro',
      );
      final title = context.knobs.text(
        label: 'Título da Página', 
        initial: 'Minhas Finanças',
      );
      final showBack = context.knobs.boolean(
        label: 'Botão Voltar', 
        initial: false,
      );

      /// Configuramos o User Mock
      final mockUser = MockUser();
      when(() => mockUser.displayName).thenReturn(mockName);

      /// Configuramos o AuthService Mock
      final mockAuth = MockAuthService();
      when(() => mockAuth.currentUser).thenReturn(mockUser);

      return Scaffold(
        appBar: AppTopBar(
          title: title,
          showBackButton: showBack,
          authService: mockAuth, 
        ),
        body: const Center(
          child: Text('Conteúdo da visualização'),
        ),
      );
    },
  ),
];