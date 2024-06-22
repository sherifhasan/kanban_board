import 'package:kanban_board/domain/task_repository.dart';
import 'package:kanban_board/infrastructure/datasource/tasks_datasource.dart';
import 'package:kanban_board/infrastructure/models/task_dto.dart';

class TaskRepositoryImpl extends TaskRepository {
  final TasksDataSource remoteTasksDataSource;

  TaskRepositoryImpl({required this.remoteTasksDataSource});

  @override
  Future<TaskDto> addTask(String content) {
    return remoteTasksDataSource.addTask(content);
  }
}
