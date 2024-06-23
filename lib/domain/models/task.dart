import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';

enum TaskStatus { toDo, inProgress, done }

@freezed
class Task with _$Task {
  const factory Task({
    required String id,
    required String content,
    required DateTime createdAt,
    @Default([]) List<Comment> comments,
    @Default(TaskStatus.toDo) TaskStatus status,
    @Default(0) int timeSpent, // Time spent in seconds
    @Default(false) bool isTiming, // Timer status
  }) = _Task;
}

@freezed
class Comment with _$Comment {
  const factory Comment({
    required String content,
  }) = _Comment;
}
