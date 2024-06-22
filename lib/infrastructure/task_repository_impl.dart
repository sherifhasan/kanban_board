import 'package:kanban_board/domain/task_repository.dart';
import 'package:kanban_board/infrastructure/datasource/tasks_datasource.dart';
import 'package:kanban_board/infrastructure/models/comment_dto.dart';
import 'package:kanban_board/infrastructure/models/task_dto.dart';

class TaskRepositoryImpl extends TaskRepository {
  final TasksDataSource remoteTasksDataSource;

  TaskRepositoryImpl({required this.remoteTasksDataSource});

  @override
  Future<TaskDto> addTask(String content) {
    return remoteTasksDataSource.addTask(content);
  }

  @override
  Future<CommentDto> addComment(String taskId, String content) {
    return remoteTasksDataSource.addComment(taskId, content);
  }

  @override
  Future<bool> closeTask(String taskId) {
    return remoteTasksDataSource.closeTask(taskId);
  }

  @override
  Future<List<CommentDto>> getAllComments(String taskId) {
    return remoteTasksDataSource.getAllComments(taskId);
  }

  @override
  Future<List<TaskDto>> getAllTasks(String filter) {
    return remoteTasksDataSource.getAllTasks(filter);
  }
}
