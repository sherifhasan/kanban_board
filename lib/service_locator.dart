import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:kanban_board/application/features/tasks/tasks_cubit.dart';
import 'package:kanban_board/domain/task_repository.dart';
import 'package:kanban_board/infrastructure/datasource/remote_tasks_data_source_impl.dart';
import 'package:kanban_board/infrastructure/datasource/tasks_datasource.dart';
import 'package:kanban_board/infrastructure/task_repository_impl.dart';

final sl = GetIt.instance;
const apiToken = 'add your token here';

void setup() {
  // Register Dio
  sl.registerLazySingleton<Dio>(() => Dio(BaseOptions(
        baseUrl: 'https://api.todoist.com/rest/v2',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiToken',
        },
      )));

  // Register TasksDataSource
  sl.registerLazySingleton<TasksDataSource>(
      () => RemoteTasksDataSourceImpl(dio: sl<Dio>()));

  // Register TaskRepository
  sl.registerLazySingleton<TaskRepository>(
      () => TaskRepositoryImpl(remoteTasksDataSource: sl<TasksDataSource>()));

  // Register TaskCubit
  sl.registerFactory<TasksCubit>(
      () => TasksCubit(taskRepository: sl<TaskRepository>()));
}
