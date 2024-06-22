import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kanban_board/infrastructure/datasource/tasks_datasource.dart';
import 'package:kanban_board/infrastructure/models/task_dto.dart';

class RemoteTasksDataSourceImpl extends TasksDataSource {
  final Dio dio;

  RemoteTasksDataSourceImpl({required this.dio});

  @override
  Future<TaskDto> addTask(String content) async {
    final response = await dio.post('/tasks',
        data: jsonEncode({
          'content': content,
          'project_id': 2335101376,
        }));

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Failed to add task');
    }
    return TaskDto.fromJson(response.data);
  }

}
