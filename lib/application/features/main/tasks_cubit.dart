import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:kanban_board/domain/models/task.dart';
import 'package:kanban_board/domain/task_repository.dart';
import 'package:kanban_board/infrastructure/models/remote/task_dto.dart';
import 'package:kanban_board/infrastructure/models/remote/comment_dto.dart';

part 'task_state.dart';

part 'tasks_cubit.freezed.dart';

class TasksCubit extends Cubit<TaskState> {
  final TaskRepository taskRepository;

  TasksCubit({required this.taskRepository}) : super(const TaskState.initial());

  Future<void> loadTasks(String filter) async {
    try {
      emit(const TaskState.loading());
      final taskDtos = await taskRepository.getAllTasks();
      final tasks = taskDtos.map((dto) => dto.toDomain()).toList();
      emit(TaskState.loaded(tasks));
    } catch (e) {
      emit(TaskState.error(e.toString()));
    }
  }

  Future<void> addTask(String content) async {
    try {
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

  Future<void> updateTask(Task task) async {
    try {
      final taskDto = await taskRepository.updateTask(task.id, task.content);
      final updatedTask = taskDto.toDomain();
      final currentState = state;
      if (currentState is _Loaded) {
        final updatedTasks = currentState.tasks.map((t) {
          return t.id == task.id ? updatedTask : t;
        }).toList();
        emit(TaskState.loaded(updatedTasks));
      }
    } catch (e) {
      emit(TaskState.error(e.toString()));
    }
  }

  Future<void> deleteTask(String taskId) async {
    try {
      await taskRepository.deleteTask(taskId);
      final currentState = state;
      if (currentState is _Loaded) {
        final updatedTasks =
            currentState.tasks.where((task) => task.id != taskId).toList();
        emit(TaskState.loaded(updatedTasks));
      }
    } catch (e) {
      emit(TaskState.error(e.toString()));
    }
  }

  Future<void> moveTask(Task task, TaskStatus newStatus) async {
    try {
      final updatedTask = task.copyWith(status: newStatus);
      final currentState = state;
      if (currentState is _Loaded) {
        final updatedTasks = currentState.tasks.map((t) {
          return t.id == task.id ? updatedTask : t;
        }).toList();
        emit(TaskState.loaded(updatedTasks));
      }
    } catch (e) {
      emit(TaskState.error(e.toString()));
    }
  }

  Future<void> closeTask(String taskId) async {
    try {
      final success = await taskRepository.closeTask(taskId);
      if (success) {
        final currentState = state;
        if (currentState is _Loaded) {
          final updatedTasks = currentState.tasks.map((currentTask) {
            if (currentTask.id == taskId) {
              return currentTask.copyWith(status: TaskStatus.done);
            }
            return currentTask;
          }).toList();
          emit(TaskState.loaded(updatedTasks));
        }
      }
    } catch (e) {
      emit(TaskState.error(e.toString()));
    }
  }

  Future<void> loadComments(String taskId) async {
    try {
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

  Future<void> addComment(String taskId, String content) async {
    try {
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

  Future<void> startTimer(String taskId) async {
    final currentState = state;
    if (currentState is _Loaded) {
      final updatedTasks = currentState.tasks.map((task) {
        if (task.id == taskId) {
          return task.copyWith(isTiming: true, status: TaskStatus.inProgress);
        }
        return task;
      }).toList();
      emit(TaskState.loaded(updatedTasks));
    }
  }

  Future<void> stopTimer(String taskId, int timeSpent) async {
    final currentState = state;
    if (currentState is _Loaded) {
      await taskRepository.closeTask(taskId);
      final updatedTasks = currentState.tasks.map((task) {
        if (task.id == taskId) {
          return task.copyWith(
              isTiming: false,
              timeSpent: task.timeSpent + timeSpent,
              status: TaskStatus.done);
        }
        return task;
      }).toList();
      emit(TaskState.loaded(updatedTasks));
    }
  }
}
