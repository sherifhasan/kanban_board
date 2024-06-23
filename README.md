# Kanban board <img src="https://img.shields.io/badge/made%20with-dart-blue.svg" alt="made with dart">

This app assists users in creating and managing their tasks. It follows the Domain-Driven Design (DDD) architecture for a clear separation of concerns, utilizes GetIt for dependency injection, and employs the BLoC (Business Logic Component) pattern for state management.

![Kanban Board Demo](screenshots/video.gif)

### Features
1. **Kanban Board**: A kanban board for tasks, where users can create, edit, and move tasks between different columns (e.g. "To Do", "In Progress", "Done").
2. **Timer Function**: A timer function that allows users to start and stop tracking the time spent on each task.
3. **History of Completed Tasks**: A history of completed tasks, including the time spent on each task and the date it was completed.
4. **Comments**: Users can comment on each task.

### Architecture

1. **Domain-Driven Design (DDD)**:
   - Helps separate domain logic from framework-specific code, leading to a modular and maintainable Flutter app architecture.
   - Improves testability, scalability, and flexibility of the application.

### State Management

Using [bloc](https://pub.dev/packages/flutter_bloc) as a state management solution offers the benefits of separation of concerns, flexibility, and reactive updates for a well-structured and efficient codebase.

### Dependency Injection

Using [GetIt](https://pub.dev/packages/get_it) in Flutter simplifies dependency injection, singleton management, and testing, improving code organization and modularity.

### Network Calls

Using the [dio](https://pub.dev/packages/dio) package in Flutter offers simplicity, lightweight implementation, and built-in support for standard HTTP requests.

### JSON Parsing

Using the [Freezed](https://pub.dev/packages/freezed) package with [JSON Serializable](https://pub.dev/packages/json_serializable) package in Flutter simplifies JSON parsing by generating immutable data classes and automatic serialization/deserialization. It provides type safety, reducing runtime exceptions and improving code quality.

### Database

Using the [Hive](https://pub.dev/packages/hive) package, a lightweight database, offers simplicity for saving completed tasks in the local database.

### Setup and Installation

**Clone the repository**:
   ```sh
   git clone https://github.com/your-username/kanban-board.git
   cd kanban-board
