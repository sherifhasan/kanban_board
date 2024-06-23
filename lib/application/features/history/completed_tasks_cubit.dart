import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban_board/domain/models/task.dart';
import 'package:kanban_board/domain/task_repository.dart';
import 'package:kanban_board/infrastructure/models/task_dto.dart';

part 'completed_tasks_state.dart';

part 'completed_tasks_cubit.freezed.dart';

class CompletedTasksCubit extends Cubit<CompletedTasksState> {
  final TaskRepository taskRepository;

  CompletedTasksCubit({required this.taskRepository})
      : super(const CompletedTasksState.initial());

  Future<void> loadCompletedTasks() async {
    try {
      emit(const CompletedTasksState.loading());
      final taskDtos = await taskRepository.getAllTasks();
      final tasks = taskDtos
          .where((taskDto) => taskDto.isCompleted)
          .map((taskDto) => taskDto.toDomain())
          .toList();
      if (tasks.isNotEmpty) {
        emit(CompletedTasksState.loaded(tasks));
      } else {
        emit(const CompletedTasksState.initial());
      }
    } catch (e) {
      emit(CompletedTasksState.error(e.toString()));
    }
  }
}
