import 'package:kanban_board/infrastructure/models/comment_dto.dart';
import 'package:kanban_board/infrastructure/models/task_dto.dart';

abstract class TasksDataSource {
  Future<TaskDto> addTask(String content);

  Future<List<TaskDto>> getAllTasks(String filter);

  Future<CommentDto> addComment(String taskId, String content);

  Future<List<CommentDto>> getAllComments(String taskId);
}
