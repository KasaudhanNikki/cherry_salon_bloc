# Flutter Clean Architecture App

A Flutter project demonstrating **Clean Architecture**, **BLoC state management**, and **Dependency Injection**.

## Features

* Login functionality using BLoC
* Counter example using BLoC
* Light / Dark theme switching using Cubit
* Feature-based project structure
* Dependency Injection with GetIt

## Architecture

The project follows **Clean Architecture** with three layers:

```
Presentation (UI + Bloc)
        ↓
Domain (UseCases + Entities)
        ↓
Data (Repositories + DataSources)
```

## Project Structure

```
lib/
│
├── core/
├── features/
│   ├── auth/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   └── counter/
│       └── presentation/
│
├── theme/
├── injection_container.dart
└── main.dart
```

## Technologies

* Flutter
* Dart
* flutter_bloc
* GetIt
* Dio

## Run Project

```bash
flutter pub get
flutter run
```

## App Flow

```
LoginPage → CounterPage
```

``Credentials 
Email:emilys
Password:emilyspass
``
