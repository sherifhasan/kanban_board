# Kanban board <img src="https://img.shields.io/badge/made%20with-dart-blue.svg" alt="made with dart">


This app assists users in creating and manging their tasks. It follows the Domain-Driven Design (DDD) architecture for a clear separation of concerns, utilizes GetIt for dependency injection, and employs the BLoC (Business Logic Component) pattern for state management. Flutter Hooks is used for stateful logic within functional widgets.

### Architecture

1. Domain driven design helps separate domain logic from framework-specific code,
   leading to a modular and maintainable Flutter app architecture.
2. Applying DDD principles in Flutter improves testability, scalability, and flexibility of the
   application.

### State management

Using [bloc](https://pub.dev/packages/flutter_bloc) as a state management solution allows us to
benefit from BLoC in our Flutter app as it offers the benefits of separation of concerns,
flexibility,
and reactive updates for a well-structured and efficient codebase.

### Dependency injection

1. Using [GETIT](https://pub.dev/packages/get_it) in Flutter simplifies dependency injection,
   singleton management, and testing,
2. Improving code organization and modularity.

### Network calls

Using the [dio](https://pub.dev/packages/dio) package in Flutter offers simplicity, lightweight
implementation, and built-in support for standard HTTP requests.

### JSON parsing

Using the [Freezed](https://pub.dev/packages/freezed) package
with [JSON Serializable](https://pub.dev/packages/json_serializable) package in Flutter simplifies
JSON parsing by generating immutable data classes and automatic serialization/deserialization.
It provides type safety, reducing runtime exceptions and improving code quality.

### Database
Using the [Hive]([https://pub.dev/packages/freezed](https://pub.dev/packages/hive)) package
lightweight database offers simplicity using it for saving completed tasks in local database
