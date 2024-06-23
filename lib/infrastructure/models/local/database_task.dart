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
  final TaskStatus status;

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
      status: task.status,
      timeSpent: task.timeSpent,
      isTiming: task.isTiming,
    );
  }

  Task toTask() {
    return Task(
      id: id,
      content: content,
      createdAt: createdAt,
      status: status,
      timeSpent: timeSpent,
      isTiming: isTiming,
    );
  }
}
