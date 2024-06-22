import 'package:kanban_board/infrastructure/models/task_dto.dart';

abstract class TasksDataSource {
  Future<TaskDto> addTask(String content);
}
