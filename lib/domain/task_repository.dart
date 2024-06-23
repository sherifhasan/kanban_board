import 'package:kanban_board/infrastructure/models/comment_dto.dart';
import 'package:kanban_board/infrastructure/models/task_dto.dart';

abstract class TaskRepository {
  Future<TaskDto> addTask(String content);

  Future<List<TaskDto>> getAllTasks();

  Future<CommentDto> addComment(String taskId, String content);

  Future<List<CommentDto>> getAllComments(String taskId);

  Future<bool> closeTask(String taskId);

  Future<TaskDto> updateTask(String taskId, String content);

  Future<void> deleteTask(String taskId);
}
