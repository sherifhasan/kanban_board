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

final sl = GetIt.instance;
const apiToken = 'add your token';

void setup() {
  setupDatabase();
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

  // Register HiveBox
  sl.registerLazySingleton<Box>(() => Hive.box<DatabaseTask>('completedTasks'));

  // Register TaskRepository
  sl.registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl(
      remoteTasksDataSource: sl<TasksDataSource>(),
      completedTasksBox: sl<Box<DatabaseTask>>()));

  // Register TasksCubit
  sl.registerFactory<TasksCubit>(
      () => TasksCubit(taskRepository: sl<TaskRepository>()));

  // Register CompletedTasksCubit
  sl.registerFactory<CompletedTasksCubit>(
      () => CompletedTasksCubit(taskRepository: sl<TaskRepository>()));
}
