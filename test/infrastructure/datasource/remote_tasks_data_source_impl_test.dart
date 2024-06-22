import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_board/infrastructure/datasource/remote_tasks_data_source_impl.dart';
import 'package:kanban_board/infrastructure/datasource/tasks_datasource.dart';
import 'package:kanban_board/infrastructure/models/task_dto.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';

// Extend Mock to create a mock class for Dio.
class MockDio extends Mock implements Dio {}

void main() {
  setUpAll(() {
    // Register the fallback values for named parameters used in Dio methods.
    registerFallbackValue(Uri());
    registerFallbackValue(RequestOptions(path: ''));
  });

  group('TaskRemoteDataSource', () {
    late MockDio dio;
    late TasksDataSource remoteTaskDataSource;

    setUp(() {
      dio = MockDio();
      remoteTaskDataSource = RemoteTasksDataSourceImpl(dio: dio);
    });

    test('should return Task when the API call is successful', () async {
      final taskJson = {
        'id': '2995104339',
        'content': 'setup project',
        'description': '',
        'comment_count': 0,
        'is_completed': false,
        'order': 1,
        'priority': 1,
        'project_id': '2203306141',
        'labels': [],
        'due': null,
        'section_id': null,
        'parent_id': null,
        'creator_id': '2671355',
        'created_at': '2019-12-11T22:36:50.000000Z',
        'assignee_id': null,
        'assigner_id': null,
        'url': 'https://todoist.com/showTask?id=2995104339'
      };

      // Mock the Dio post method to return the expected response.
      when(() => dio.post(
            any(),
            data: any(named: 'data'),
          )).thenAnswer((_) async => Response(
            data: taskJson,
            statusCode: 201,
            requestOptions: RequestOptions(path: ''),
          ));

      final task = await remoteTaskDataSource.addTask('setup project');

      expect(task, isA<TaskDto>());
      expect(task.id, '2995104339');
      expect(task.content, 'setup project');
    });

    test('should throw an exception when the API call fails', () {
      // Mock the Dio post method to return an error response.
      when(() => dio.post(
            any(),
            data: any(named: 'data'),
          )).thenAnswer((_) async => Response(
            data: 'Failed to add task',
            statusCode: 400,
            requestOptions: RequestOptions(path: ''),
          ));

      expect(remoteTaskDataSource.addTask('setup project'), throwsException);
    });
  });
}
