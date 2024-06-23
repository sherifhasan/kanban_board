import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kanban_board/application/features/history/completed_tasks_cubit.dart';
import 'package:kanban_board/application/features/main/tasks_cubit.dart';
import 'package:kanban_board/domain/task_repository.dart';
import 'package:kanban_board/infrastructure/datasource/remote_tasks_data_source_impl.dart';
import 'package:kanban_board/infrastructure/datasource/tasks_datasource.dart';
import 'package:kanban_board/infrastructure/task_repository_impl.dart';

import 'infrastructure/models/local/local.dart';

final injection = GetIt.instance;
const apiToken = 'add your token';

Future<void> setup() async {
  await setupDatabase();
  setupLocators();
}

Future<void> setupDatabase() async {
  final appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);

  Hive.registerAdapter(DatabaseTaskAdapter());
  Hive.registerAdapter(DatabaseCommentAdapter());
  await Hive.openBox<DatabaseTask>('completedTasks');
}

void setupLocators() {
  // Register Dio
  injection.registerLazySingleton<Dio>(() => Dio(BaseOptions(
        baseUrl: 'https://api.todoist.com/rest/v2',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiToken',
        },
      )));

  // Register TasksDataSource
  injection.registerLazySingleton<TasksDataSource>(
      () => RemoteTasksDataSourceImpl(dio: injection<Dio>()));

  // Register HiveBox
  injection.registerLazySingleton<Box<DatabaseTask>>(
      () => Hive.box<DatabaseTask>('completedTasks'));

  // Register TaskRepository
  injection.registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl(
      remoteTasksDataSource: injection<TasksDataSource>(),
      completedTasksBox: injection<Box<DatabaseTask>>()));

  // Register TasksCubit
  injection.registerFactory<TasksCubit>(
      () => TasksCubit(taskRepository: injection<TaskRepository>()));

  // Register CompletedTasksCubit
  injection.registerFactory<CompletedTasksCubit>(
      () => CompletedTasksCubit(taskRepository: injection<TaskRepository>()));
}
