![Flutter](https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.x-blue?logo=dart)
![Architecture](https://img.shields.io/badge/Architecture-DDD%20%2B%20Feature%20First-purple)
![Design System](https://img.shields.io/badge/Design%20System-Custom-pink)
![Storybook](https://img.shields.io/badge/Storybook-Flutter-orange)
![Status](https://img.shields.io/badge/Status-Work%20In%20Progress-yellow)

<h1 align="center">
  <a href="https://github.com/mandi-tech/tech-challenge-fase-02">
    Tech Challenge - Fase 03: Gerenciador Financeiro
  </a>
</h1>

<p align="center">
  <a href="#sobre">Sobre</a>  &nbsp |&nbsp &nbsp  
  <a href="#tecnologias">Tecnologias</a>  &nbsp |&nbsp &nbsp 
  <a href="#requisitos">Requisitos</a>  &nbsp |&nbsp &nbsp
  <a href="#executando">Executando</a>  &nbsp |&nbsp &nbsp
  <a href="#design-system">Design System</a>  &nbsp |&nbsp &nbsp
  <a href="#demonstracao">Demonstração</a>  &nbsp |&nbsp &nbsp
  <a href="#equipe">Equipe</a>
</p>

<br />

Aplicativo Flutter para **gerenciamento financeiro pessoal**, desenvolvido com foco em:

- arquitetura escalável
- design system reutilizável
- documentação de UI via Storybook
- organização modular de features

O projeto funciona como **base arquitetural para aplicações Flutter maiores**, explorando boas práticas utilizadas em times profissionais.

<br />

## ✨ Objetivos do projeto

Este projeto foi criado para explorar e demonstrar:

- Arquitetura **DDD + Feature First**
- **Design System próprio**
- Componentização consistente
- Storybook para documentação visual
- Separação clara de responsabilidades
- Escalabilidade estrutural

<br />

## 🏗 Arquitetura

O projeto utiliza uma arquitetura híbrida baseada em:

- **DDD (Domain Driven Design)**
- **Feature First**

Isso permite organizar o código por **domínio de negócio**, enquanto mantém **infraestrutura compartilhada isolada**.

<br />

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

<br />

<span id="design-system">

## 🎨 Design System

O projeto possui um **Design System próprio**, responsável por centralizar:

- tokens visuais
- componentes reutilizáveis
- temas

Isso garante:

- consistência visual
- reutilização de código
- manutenção simplificada

<br />

## 🎨 Tokens

Localizados em:

```
shared/design_system/tokens
```

### Colors

```
AppColors.primary
AppColors.secondary
AppColors.accent
AppColors.background
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

<br />

## 🧩 Componentes

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

<br />

## 📚 Storybook

O projeto utiliza **Storybook Flutter** para documentar visualmente os componentes do Design System.

Isso permite:

- visualizar componentes isoladamente
- testar estados
- validar responsividade
- documentar tokens

### Rodar o Storybook

```bash
flutter run -t lib/main_storybook.dart
```

<br />

## 🚀 Como rodar o projeto

### Instalar dependências

```bash
flutter pub get
```

### Rodar o aplicativo

```bash
flutter run
```

<br />

<span id="demonstracao">

## 🎥 Vídeo demonstrativo

Um vídeo de até 5 minutos foi gravado para demonstrar todo o fluxo do front-end, incluindo navegação, listagem, adição, edição e exclusão de transações, conforme solicitado. [Assista ao vídeo demonstrativo clicando aqui.](https://www.youtube.com/watch?v=7yawItuhJDM)

<br />

<span id="equipe">

## 👥 Equipe - Grupo 01

|    RM     | Nome |  LinkedIn  |  GitHub  |
| :-------: | :--: | :---------:|:-------: |
| RM367409  | Isabelle Dias Ribeiro Silva|[![Linkedin Badge](https://img.shields.io/badge/Linkedin-blue?style=flat-square&logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/drisabelles) | [![GitHub Badge](https://img.shields.io/badge/GitHub-111217?style=flat-square&logo=github&logoColor=white)](https://github.com/drisabelles)|
| RM367047 | Mariana Ayumi Tamay | [![Linkedin Badge](https://img.shields.io/badge/Linkedin-blue?style=flat-square&logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/marianatamay) | [![GitHub Badge](https://img.shields.io/badge/GitHub-111217?style=flat-square&logo=github&logoColor=white)](https://github.com/Mariayumi)
