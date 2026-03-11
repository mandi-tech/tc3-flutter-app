<h1 align="center">
  Tech Challenge - Fase 03: Gerenciador Financeiro
</h1>

<p align="center">
  
  ![Flutter](https://img.shields.io/badge/Flutter-3.41.2-blue?logo=flutter)
  ![Dart](https://img.shields.io/badge/Dart-3.11.0-blue?logo=dart)
  ![Architecture](https://img.shields.io/badge/Architecture-DDD%20%2B%20Feature%20First-purple)
  ![Design System](https://img.shields.io/badge/Design%20System-Custom-pink)
  ![Storybook](https://img.shields.io/badge/Storybook-Flutter-orange)
  ![Firebase](https://img.shields.io/badge/Firebase-Firestore%20%2B%20Storage-orange)
  ![Status](https://img.shields.io/badge/Status-Work%20In%20Progress-yellow)
  
</p>

## 📑 Sumário

- 📱 [Sobre o projeto](#sobre)
- 🛠 [Tecnologias](#tecnologias)
- ✨ [Funcionalidades](#funcionalidades)
- 🏗 [Arquitetura](#arquitetura)
- 📂 [Estrutura do projeto](#estrutura)
- 🧠 [Gerenciamento de estado](#estado)
- 🎨 [Design System](#design-system)
- 📚 [Storybook](#storybook)
- 🚀 [Executando o projeto](#exe)
- 🔥 [Configuração do Firebase](#firebase)
- 🎥 [Demonstração](#demonstracao)
- 👥 [Equipe](#equipe)

---

<span id="sobre">

## 📱 Sobre o projeto

Aplicativo mobile desenvolvido em **Flutter** para **gerenciamento
financeiro pessoal**.

O projeto foi desenvolvido como parte do **Tech Challenge - Fase 03** da Pós Tech, com o objetivo de aplicar conceitos de:

-   arquitetura escalável
-   design system reutilizável
-   integração com Firebase
-   gerenciamento de estado
-   documentação visual de componentes

A aplicação permite que usuários autenticados **cadastrem, visualizem,
filtrem e gerenciem transações financeiras**, incluindo anexos de
recibos.

---

<span id="tecnologias">

## 🛠 Tecnologias

O projeto foi desenvolvido utilizando as seguintes tecnologias:

### Mobile

- **Flutter** — framework para desenvolvimento mobile multiplataforma
- **Dart** — linguagem utilizada pelo Flutter

### Backend / Cloud

- **Firebase Authentication** — autenticação de usuários
- **Cloud Firestore** — banco de dados NoSQL para armazenamento de transações
- **Firebase Storage** — armazenamento de recibos e anexos

### Gerenciamento de Estado

- **Provider** — gerenciamento de estado da aplicação

### UI / Design

- **Custom Design System** — tokens e componentes reutilizáveis
- **Storybook Flutter** — documentação visual de componentes

### Ferramentas

- **Git / GitHub** — versionamento de código

---

<span id="funcionalidades">

## ✨ Funcionalidades

### 🔐 Autenticação

-   Login de usuário
-   Registro de novos usuários
-   Persistência de sessão

### 📊 Dashboard Financeiro

-   Visualização de gráficos financeiros
-   Análise das transações cadastradas

### 💸 Gerenciamento de Transações

-   Listagem de transações
-   Filtros por categoria e data
-   Paginação / scroll infinito

### ➕ Cadastro de Transações

-   Adicionar novas transações
-   Editar transações existentes
-   Validação de campos

### 📎 Upload de Recibos

-   Upload de comprovantes
-   Armazenamento no **Firebase Storage**

---

<span id="arquitetura">

## 🏗 Arquitetura

O projeto utiliza uma arquitetura baseada em:

### **DDD (Domain Driven Design)**

Separação clara entre:

-   Domain
-   Application / UseCases
-   Presentation
-   Infrastructure

### **Feature First**

Organização baseada em funcionalidades da aplicação.

Isso permite:

-   melhor escalabilidade
-   maior isolamento de features
-   código mais fácil de manter

---

<span id="estrutura">

## 📂 Estrutura do projeto

    lib/
    │
    ├── app/
    │   └── router/
    │
    ├── core/
    │   └── error/
    │
    ├── features/
    │   ├── auth/
    │   │   ├── login/
    │   │   └── register/
    │   │
    │   ├── dashboard/
    │   └── transactions/
    │
    ├── shared/
    │   ├── design_system/
    │   │   ├── components/
    │   │   ├── tokens/
    │   │   └── themes/
    │   │
    │   └── utils/
    │
    ├── storybook/
    │
    ├── main.dart
    └── main_storybook.dart

---

<span id="estado">

## 🧠 Gerenciamento de estado

O gerenciamento de estado é realizado utilizando: 

    Provider

Responsável por gerenciar:
- estado de autenticação
- estado das transações
- atualização da interface

---

<span id="design-system">

## 🎨 Design System

O projeto possui um **Design System próprio**, responsável por
centralizar:

-   tokens visuais
-   componentes reutilizáveis
-   temas

### 🎨 Tokens

Localizados em:

    shared/design_system/tokens

#### Colors

    AppColors.primary
    AppColors.secondary
    AppColors.accent
    AppColors.background
    AppColors.surface

#### Spacing

    AppSpacing.xs
    AppSpacing.sm
    AppSpacing.md
    AppSpacing.lg
    AppSpacing.xl

#### Typography

    AppTypography.title
    AppTypography.subtitle
    AppTypography.body
    AppTypography.caption
    AppTypography.button

### 🧩 Componentes

Localizados em:

    shared/design_system/components

Componentes disponíveis:

-   AppButton
-   AppTextField
-   AppEmailField
-   AppPasswordField

Exemplo:

``` dart
AppButton(
  label: 'Entrar',
  onPressed: () {},
)
```

---

<span id="storybook">

## 📚 Storybook

O projeto utiliza **Storybook Flutter** para documentar visualmente os
componentes.

Permite:

-   visualizar componentes isoladamente
-   testar diferentes estados
-   documentar tokens
-   validar consistência visual

### Rodar Storybook

``` bash
flutter run -t lib/main_storybook.dart
```

---

<span id="exe">

## 🚀 Executando o projeto

### Instalar dependências

    flutter pub get

### Rodar aplicativo

    flutter run

---

<span id="firebase">

## 🔥 Configuração do Firebase

O projeto utiliza:

-   Firebase Authentication
-   Cloud Firestore
-   Firebase Storage

### Criar projeto

https://console.firebase.google.com

### Instalar dependências

    flutter pub add firebase_core
    flutter pub add firebase_auth
    flutter pub add cloud_firestore
    flutter pub add firebase_storage

### Inicializar Firebase

``` dart
await Firebase.initializeApp();
```

---

<span id="demonstracao">

## 🎥 Demonstração

Vídeo demonstrando:

-   login
-   cadastro de transações
-   edição
-   filtros
-   upload de recibos
-   integração com Firebase

https://www.youtube.com/watch?v=7yawItuhJDM

---

<span id="equipe">

## 👥 Equipe - Grupo 01

| RM | Nome | LinkedIn | GitHub | 
| :-------: | :--: | :---------:|:-------: | 
| RM367409 | Isabelle Dias Ribeiro Silva|[![Linkedin Badge](https://img.shields.io/badge/Linkedin-blue?style=flat-square&logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/drisabelles) | [![GitHub Badge](https://img.shields.io/badge/GitHub-111217?style=flat-square&logo=github&logoColor=white)](https://github.com/drisabelles)| 
| RM367047 | Mariana Ayumi Tamay | [![Linkedin Badge](https://img.shields.io/badge/Linkedin-blue?style=flat-square&logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/marianatamay) | [![GitHub Badge](https://img.shields.io/badge/GitHub-111217?style=flat-square&logo=github&logoColor=white)](https://github.com/Mariayumi)
