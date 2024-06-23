import 'package:kanban_board/infrastructure/models/remote/comment_dto.dart';
import 'package:kanban_board/infrastructure/models/remote/task_dto.dart';

abstract class TasksDataSource {
  Future<TaskDto> addTask(String content);

  Future<List<TaskDto>> getAllTasks();

  Future<CommentDto> addComment(String content, String taskId);

  Future<List<CommentDto>> getAllComments(String taskId);

  Future<bool> closeTask(String taskId);

  Future<TaskDto> updateTask(String content, String taskId);

  Future<void> deleteTask(String taskId);

  Future<TaskDto> getTask(String taskId);
}
