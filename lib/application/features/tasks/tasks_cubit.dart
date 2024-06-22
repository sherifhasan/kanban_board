import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:kanban_board/domain/models/task.dart';
import 'package:kanban_board/domain/task_repository.dart';
import 'package:kanban_board/infrastructure/models/task_dto.dart';
import 'package:kanban_board/infrastructure/models/comment_dto.dart';

part 'task_state.dart';

part 'tasks_cubit.freezed.dart';

class TasksCubit extends Cubit<TaskState> {
  final TaskRepository taskRepository;

  TasksCubit(this.taskRepository) : super(const TaskState.initial());

  Future<void> loadTasks(String filter) async {
    try {
      emit(const TaskState.loading());
      final taskDtos = await taskRepository.getAllTasks(filter);
      final tasks = taskDtos.map((dto) => dto.toDomain()).toList();
      emit(TaskState.loaded(tasks));
    } catch (e) {
      emit(TaskState.error(e.toString()));
    }
  }

//
  Future<void> addTask(String content) async {
    try {
      emit(const TaskState.loading());
      final taskDto = await taskRepository.addTask(content);
      final task = taskDto.toDomain();
      final currentState = state;
      if (currentState is _Loaded) {
        emit(TaskState.loaded([...currentState.tasks, task]));
      }
    } catch (e) {
      emit(TaskState.error(e.toString()));
    }
  }

//
  Future<void> updateTask(Task updatedTask) async {
    try {
      emit(const TaskState.loading());
      final currentState = state;
      if (currentState is _Loaded) {
        final updatedTasks = currentState.tasks.map((task) {
          return task.id == updatedTask.id ? updatedTask : task;
        }).toList();
        emit(TaskState.loaded(updatedTasks));
      }
    } catch (e) {
      emit(TaskState.error(e.toString()));
    }
  }

//
  Future<void> closeTask(String taskId) async {
    try {
      emit(const TaskState.loading());
      final success = await taskRepository.closeTask(taskId);
      if (success) {
        final currentState = state;
        if (currentState is _Loaded) {
          final updatedTasks = currentState.tasks.map((task) {
            if (task.id == taskId) {
              return task.copyWith(status: TaskStatus.done);
            }
            return task;
          }).toList();
          emit(TaskState.loaded(updatedTasks));
        }
      }
    } catch (e) {
      emit(TaskState.error(e.toString()));
    }
  }

//
  Future<void> loadComments(String taskId) async {
    try {
      emit(const TaskState.loading());
      final commentDtos = await taskRepository.getAllComments(taskId);
      final comments = commentDtos.map((dto) => dto.toDomain()).toList();
      final currentState = state;
      if (currentState is _Loaded) {
        final updatedTasks = currentState.tasks.map((task) {
          if (task.id == taskId) {
            return task.copyWith(comments: comments);
          }
          return task;
        }).toList();
        emit(TaskState.loaded(updatedTasks));
      }
    } catch (e) {
      emit(TaskState.error(e.toString()));
    }
  }

//
  Future<void> addComment(String taskId, String content) async {
    try {
      emit(const TaskState.loading());
      final commentDto = await taskRepository.addComment(taskId, content);
      final comment = commentDto.toDomain();
      final currentState = state;
      if (currentState is _Loaded) {
        final updatedTasks = currentState.tasks.map((task) {
          if (task.id == taskId) {
            return task.copyWith(comments: [...task.comments, comment]);
          }
          return task;
        }).toList();
        emit(TaskState.loaded(updatedTasks));
      }
    } catch (e) {
      emit(TaskState.error(e.toString()));
    }
  }

//
  Future<void> startTimer(String taskId) async {
    final currentState = state;
    if (currentState is _Loaded) {
      final updatedTasks = currentState.tasks.map((task) {
        if (task.id == taskId) {
          return task.copyWith(status: TaskStatus.inProgress);
        }
        return task;
      }).toList();
      emit(TaskState.loaded(updatedTasks));
    }
  }

//
  Future<void> stopTimer(String taskId, int timeSpent) async {
    final currentState = state;
    if (currentState is _Loaded) {
      final updatedTasks = currentState.tasks.map((task) {
        if (task.id == taskId) {
          return task.copyWith(status: TaskStatus.toDo);
        }
        return task;
      }).toList();
      emit(TaskState.loaded(updatedTasks));
    }
  }
}
