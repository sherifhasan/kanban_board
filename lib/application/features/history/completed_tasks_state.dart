part of 'completed_tasks_cubit.dart';

@freezed
class CompletedTasksState with _$CompletedTasksState {
  const factory CompletedTasksState.initial() = _Initial;

  const factory CompletedTasksState.loading() = _Loading;

  const factory CompletedTasksState.loaded(List<Task> tasks) = _Loaded;

  const factory CompletedTasksState.error(String message) = _Error;
}
