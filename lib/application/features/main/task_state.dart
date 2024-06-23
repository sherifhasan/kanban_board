part of 'tasks_cubit.dart';


@freezed
class TaskState with _$TaskState {
  const factory TaskState.initial() = _Initial;

  const factory TaskState.loading() = _Loading;

  const factory TaskState.loaded(List<Task> tasks) = _Loaded;

  const factory TaskState.error(String message) = _Error;
}
