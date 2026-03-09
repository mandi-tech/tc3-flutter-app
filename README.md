# 📱 Finance Manager

![Flutter](https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.x-blue?logo=dart)
![Architecture](https://img.shields.io/badge/Architecture-DDD%20%2B%20Feature%20First-purple)
![Design System](https://img.shields.io/badge/Design%20System-Custom-pink)
![Storybook](https://img.shields.io/badge/Storybook-Flutter-orange)
![Status](https://img.shields.io/badge/Status-Work%20In%20Progress-yellow)

Aplicativo Flutter para **gerenciamento financeiro pessoal**, desenvolvido com foco em:

- arquitetura escalável
- design system reutilizável
- documentação de UI via Storybook
- organização modular de features

O projeto funciona como **base arquitetural para aplicações Flutter maiores**, explorando boas práticas utilizadas em times profissionais.

---

# ✨ Objetivos do projeto

Este projeto foi criado para explorar e demonstrar:

- Arquitetura **DDD + Feature First**
- **Design System próprio**
- Componentização consistente
- Storybook para documentação visual
- Separação clara de responsabilidades
- Escalabilidade estrutural

---

# 🏗 Arquitetura

O projeto utiliza uma arquitetura híbrida baseada em:

- **DDD (Domain Driven Design)**
- **Feature First**

Isso permite organizar o código por **domínio de negócio**, enquanto mantém **infraestrutura compartilhada isolada**.

---

## Estrutura de diretórios

```
lib/
│
├── app/
│   └── router/
│       └── app_router.dart
│
├── core/
│   └── error/
│       └── exceptions.dart
│
├── features/
│   ├── auth/
│   │   ├── login/
│   │   └── register/
│   │
│   └── home/
│
├── shared/
│   ├── design_system/
│   │   ├── components/
│   │   ├── tokens/
│   │   └── themes/
│   │
│   └── utils/
│       └── navigation_extensions.dart
│
├── storybook/
│   ├── stories/
│   ├── widgets/
│   └── storybook_app.dart
│
├── main.dart
└── main_storybook.dart
```

---

# 🎨 Design System

O projeto possui um **Design System próprio**, responsável por centralizar:

- tokens visuais
- componentes reutilizáveis
- temas

Isso garante:

- consistência visual
- reutilização de código
- manutenção simplificada

---

# 🎨 Tokens

Localizados em:

```
shared/design_system/tokens
```

### Colors

```
AppColors.primary
AppColors.secondary
AppColors.accent
context.theme.scaffoldBackgroundColor
AppColors.surface
```

### Spacing

```
AppSpacing.xs
AppSpacing.sm
AppSpacing.md
AppSpacing.lg
AppSpacing.xl
```

### Typography

```
AppTypography.title
AppTypography.body
AppTypography.caption
```

---

# 🧩 Componentes

Localizados em:

```
shared/design_system/components
```

Componentes disponíveis:

- AppButton
- AppTextField
- AppEmailField
- AppPasswordField

Exemplo:

```dart
AppButton(
  label: 'Entrar',
  onPressed: () {},
)
```

---

# 📚 Storybook

O projeto utiliza **Storybook Flutter** para documentar visualmente os componentes do Design System.

Isso permite:

- visualizar componentes isoladamente
- testar estados
- validar responsividade
- documentar tokens

## Rodar o Storybook

```bash
flutter run -t lib/main_storybook.dart
```

---

# 🚀 Como rodar o projeto

## Instalar dependências

```bash
flutter pub get
```

## Rodar o aplicativo

```bash
flutter run
```

## Rodar o Storybook

```bash
flutter run -t lib/main_storybook.dart
```
