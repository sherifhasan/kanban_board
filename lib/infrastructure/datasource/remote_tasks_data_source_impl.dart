import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:kanban_board/infrastructure/datasource/tasks_datasource.dart';
import 'package:kanban_board/infrastructure/models/task_dto.dart';
import 'package:kanban_board/infrastructure/models/comment_dto.dart';

class RemoteTasksDataSourceImpl extends TasksDataSource {
  final Dio dio;

  RemoteTasksDataSourceImpl({required this.dio});

  @override
  Future<TaskDto> addTask(String content) async {
    try {
      final response = await dio.post('/tasks',
          data: jsonEncode({
            'content': content,
            'project_id': 2335101376,
          }));

      if (response.statusCode == 200 || response.statusCode == 201) {
        return TaskDto.fromJson(response.data);
      } else {
        throw Exception('Failed to add task: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to add task: $e');
    }
  }

  @override
  Future<List<TaskDto>> getAllTasks(String filter) async {
    try {
      final response = await dio.get(
        'https://api.todoist.com/rest/v2/tasks',
        queryParameters: {'filter': filter},
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => TaskDto.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch all tasks :${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to fetch all tasks: $e');
    }
  }

  @override
  Future<CommentDto> addComment(String taskId, String content) async {
    try {
      final response = await dio.post(
        'https://api.todoist.com/rest/v2/comments',
        data: jsonEncode({
          'task_id': taskId,
          'content': content,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return CommentDto.fromJson(response.data);
      } else {
        throw Exception('Failed to add comment: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to add comment: $e');
    }
  }

  @override
  Future<List<CommentDto>> getAllComments(String taskId) async {
    try {
      final response = await dio.get(
        'https://api.todoist.com/rest/v2/comments',
        queryParameters: {'task_id': taskId},
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => CommentDto.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch comments :${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to fetch comments: $e');
    }
  }
}
