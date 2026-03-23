import 'package:flutter/material.dart';

abstract final class AppColors {
  /// Brand (Baseadas na imagem enviada)
  static const primary = Color(0xFF2B2675);    // Blue (Escuro/Sério)
  static const secondary = Color(0xFFA99BF7);  // Lavender (Vibrante)
  static const accent = Color(0xFFD1D84E);     // Apple Green (Destaque)

  /// Financial semantics
  static const income = Color(0xFF2E9F7E);
  static const expense = Color(0xFFD64550);   // Orange (Saída/Atenção)

  /// Feedback
  static const success = Color(0xFF3FAE88);
  static const warning = Color(0xFFF59E0B);
  static const danger = Color(0xFFD64550);

  /// Light (Baseadas em Cream e Sky)
  static const background = Color(0xFFFFFCF2); // Cream (Fundo quente e suave)
  static const surface = Color(0xFFFFFFFF);
  static const neutral100 = Color(0xFFE6EAFF); // Sky (Para cards e campos)

  /// Dark Mode Refinado
  static const backgroundDark = Color(0xFF0F0E24); // Um azul quase preto, bem profundo
  static const surfaceDark = Color(0xFF1D1B4B);    // Um azul um pouco mais claro para os cards "saltarem"
  static const surfaceContainerDark = Color(0xFF2B2675); // Para elementos ainda mais destacados (como o saldo)

  /// Neutrals
  static const neutral0 = Color(0xFFFFFFFF);
  static const neutral900 = Color(0xFF0F0E24);    // Blue quase preto para textos

  /// Text light
  static const textPrimary = Color(0xFF2B2675);   // Blue para leitura principal
  static const textSecondary = Color(0xFF6B6570);

  /// Textos no Dark
  static const textPrimaryDark = Color(0xFFFFFCF2);   // Cream (da sua paleta)
  static const textSecondaryDark = Color(0xFFA99BF7); // Lavender (para labels menores)

  /// Chart palette (Inspirada em toda a paleta da imagem)
  static const List<Color> categorySwatch = [
    Color(0xFF2B2675), // Blue
    Color(0xFFD1D84E), // Apple Green
    Color(0xFFE88E3D), // Orange
    Color(0xFFA99BF7), // Lavender
    Color(0xFFE6EAFF), // Sky
    Color(0xFFFFFCF2), // Cream
    Color(0xFF5A52A5), // Blue light (Variação)
  ];
}