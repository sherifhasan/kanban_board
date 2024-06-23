import 'package:hive/hive.dart';
import 'package:kanban_board/domain/models/task.dart';

part 'database_task.g.dart';

@HiveType(typeId: 0)
class DatabaseTask extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String content;

  @HiveField(2)
  final DateTime createdAt;

  @HiveField(3)
  final DatabaseTaskStatus status;

  @HiveField(4)
  final int timeSpent;

  @HiveField(5)
  final bool isTiming;

  DatabaseTask({
    required this.id,
    required this.content,
    required this.createdAt,
    required this.status,
    required this.timeSpent,
    required this.isTiming,
  });

  factory DatabaseTask.fromTask(Task task) {
    return DatabaseTask(
      id: task.id,
      content: task.content,
      createdAt: task.createdAt,
      status: _mapTaskStatusToDatabaseTaskStatus(task.status),
      timeSpent: task.timeSpent,
      isTiming: task.isTiming,
    );
  }

  Task toTask() {
    return Task(
      id: id,
      content: content,
      createdAt: createdAt,
      status: _mapDatabaseTaskStatusToTaskStatus(status),
      timeSpent: timeSpent,
      isTiming: isTiming,
    );
  }

  static DatabaseTaskStatus _mapTaskStatusToDatabaseTaskStatus(
      TaskStatus status) {
    switch (status) {
      case TaskStatus.toDo:
        return DatabaseTaskStatus.toDo;
      case TaskStatus.inProgress:
        return DatabaseTaskStatus.inProgress;
      case TaskStatus.done:
        return DatabaseTaskStatus.done;
      default:
        throw Exception('Unknown TaskStatus: $status');
    }
  }

  static TaskStatus _mapDatabaseTaskStatusToTaskStatus(
      DatabaseTaskStatus status) {
    switch (status) {
      case DatabaseTaskStatus.toDo:
        return TaskStatus.toDo;
      case DatabaseTaskStatus.inProgress:
        return TaskStatus.inProgress;
      case DatabaseTaskStatus.done:
        return TaskStatus.done;
      default:
        throw Exception('Unknown DatabaseTaskStatus: $status');
    }
  }
}

@HiveType(typeId: 1)
enum DatabaseTaskStatus {
  @HiveField(0)
  toDo,
  @HiveField(1)
  inProgress,
  @HiveField(2)
  done,
}
