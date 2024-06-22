import 'package:kanban_board/infrastructure/models/task_dto.dart';

abstract class TaskRepository {
  Future<TaskDto> addTask(String content);
}
