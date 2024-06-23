import 'package:hive/hive.dart';
import 'package:kanban_board/domain/task_repository.dart';
import 'package:kanban_board/infrastructure/datasource/tasks_datasource.dart';
import 'package:kanban_board/infrastructure/models/local/database_task.dart';

import 'models/remote/remote.dart';

class TaskRepositoryImpl extends TaskRepository {
  final TasksDataSource remoteTasksDataSource;
  final Box<DatabaseTask> completedTasksBox;

  TaskRepositoryImpl(
      {required this.remoteTasksDataSource, required this.completedTasksBox});

  @override
  Future<List<TaskDto>> getAllTasks() async {
    return await remoteTasksDataSource.getAllTasks();
  }

  @override
  Future<TaskDto> addTask(String content) async {
    return await remoteTasksDataSource.addTask(content);
  }

  @override
  Future<TaskDto> updateTask(String taskId, String content) async {
    return await remoteTasksDataSource.updateTask(taskId, content);
  }

  @override
  Future<void> deleteTask(String taskId) async {
    await remoteTasksDataSource.deleteTask(taskId);
  }

  @override
  Future<bool> closeTask(String taskId) async {
    bool success = await remoteTasksDataSource.closeTask(taskId);
    if (success) {
      final taskDto = await remoteTasksDataSource.getTask(taskId);
      final task = taskDto.toDomain();
      await completedTasksBox.put(task.id, DatabaseTask.fromTask(task));
    }
    return success;
  }

  @override
  Future<List<CommentDto>> getAllComments(String taskId) {
    return remoteTasksDataSource.getAllComments(taskId);
  }

  @override
  Future<CommentDto> addComment(String taskId, String content) {
    return remoteTasksDataSource.addComment(taskId, content);
  }

  @override
  List<DatabaseTask> getCompletedTasks() {
    return completedTasksBox.values.toList();
  }
}
