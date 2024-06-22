import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_board/infrastructure/datasource/remote_tasks_data_source_impl.dart';
import 'package:kanban_board/infrastructure/datasource/tasks_datasource.dart';
import 'package:kanban_board/infrastructure/models/task_dto.dart';
import 'package:kanban_board/infrastructure/models/comment_dto.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';

// Extend Mock to create a mock class for Dio.
class MockDio extends Mock implements Dio {}

void main() {
  setUpAll(() {
    // Register the fallback values for named parameters used in Dio methods.
    registerFallbackValue(RequestOptions(path: ''));
    registerFallbackValue(Response(requestOptions: RequestOptions(path: '')));
  });

  group('TaskRemoteDataSource', () {
    late MockDio dio;
    late TasksDataSource remoteTaskDataSource;

    setUp(() {
      dio = MockDio();
      remoteTaskDataSource = RemoteTasksDataSourceImpl(dio: dio);
    });

    group('addTask', () {
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

      test('should throw an exception when the API call fails', () async {
        // Mock the Dio post method to return an error response.
        when(() => dio.post(
              any(),
              data: any(named: 'data'),
            )).thenAnswer((_) async => Response(
              data: 'Failed to add task',
              statusCode: 400,
              requestOptions: RequestOptions(path: ''),
            ));

        expect(() async => await remoteTaskDataSource.addTask('setup project'),
            throwsException);
      });
    });

    group('getAllTasks', () {
      test(
          'should return list of completed tasks when the API call is successful',
          () async {
        final tasksJson = [
          {
            'id': '2995104339',
            'content': 'setup project',
            'description': '',
            'comment_count': 0,
            'is_completed': true,
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
          },
          // Add more tasks if necessary
        ];

        // Mock the Dio get method to return the expected response.
        when(() => dio.get(
              any(),
              queryParameters: any(named: 'queryParameters'),
            )).thenAnswer((_) async => Response(
              data: tasksJson,
              statusCode: 200,
              requestOptions: RequestOptions(path: ''),
            ));

        final tasks =
            await remoteTaskDataSource.getAllTasks('is_completed=true');

        expect(tasks, isA<List<TaskDto>>());
        expect(tasks.length, 1);
        expect(tasks[0].id, '2995104339');
        expect(tasks[0].isCompleted, true);
      });

      test(
          'should throw an exception when the API call to get completed tasks fails',
          () async {
        // Mock the Dio get method to return an error response.
        when(() => dio.get(
              any(),
              queryParameters: any(named: 'queryParameters'),
            )).thenAnswer((_) async => Response(
              data: 'Failed to fetch tasks',
              statusCode: 400,
              requestOptions: RequestOptions(path: ''),
            ));

        expect(
            () async =>
                await remoteTaskDataSource.getAllTasks('is_completed=true'),
            throwsException);
      });
    });

    group('addComment', () {
      test('should return Comment when the API call is successful', () async {
        final commentJson = {
          'content': 'Need to be started soon',
          'task_id': '2995104339',
        };

        // Mock the Dio post method to return the expected response.
        when(() => dio.post(
              any(),
              data: any(named: 'data'),
            )).thenAnswer((_) async => Response(
              data: commentJson,
              statusCode: 201,
              requestOptions: RequestOptions(path: ''),
            ));

        final comment = await remoteTaskDataSource.addComment(
            '2995104339', 'Need to be started soon');

        expect(comment, isA<CommentDto>());
        expect(comment.taskId, '2995104339');
        expect(comment.content, 'Need to be started soon');
      });

      test('should throw an exception when the API call fails', () async {
        // Mock the Dio post method to return an error response.
        when(() => dio.post(
              any(),
              data: any(named: 'data'),
            )).thenAnswer((_) async => Response(
              data: 'Failed to add comment',
              statusCode: 400,
              requestOptions: RequestOptions(path: ''),
            ));

        expect(
            () async => await remoteTaskDataSource.addComment(
                '2995104339', 'Need to be started soon'),
            throwsException);
      });
    });
    group('getAllComments', () {
      test('should return list of comments when the API call is successful',
          () async {
        final commentsJson = [
          {
            'content': 'Need to be started soon',
            'task_id': '2995104339',
          },
        ];

        // Mock the Dio get method to return the expected response.
        when(() => dio.get(
              any(),
              queryParameters: any(named: 'queryParameters'),
            )).thenAnswer((_) async => Response(
              data: commentsJson,
              statusCode: 200,
              requestOptions: RequestOptions(path: ''),
            ));

        final comments =
            await remoteTaskDataSource.getAllComments('2995104339');

        expect(comments, isA<List<CommentDto>>());
        expect(comments.length, 1);
        expect(comments[0].taskId, '2995104339');
        expect(comments[0].content, 'Need to be started soon');
      });

      test('should throw an exception when the API call to get comments fails',
          () async {
        // Mock the Dio get method to return an error response.
        when(() => dio.get(
              any(),
              queryParameters: any(named: 'queryParameters'),
            )).thenAnswer((_) async => Response(
              data: 'Failed to fetch comments',
              statusCode: 400,
              requestOptions: RequestOptions(path: ''),
            ));

        expect(
            () async => await remoteTaskDataSource.getAllComments('2995104339'),
            throwsException);
      });
    });
  });
}
