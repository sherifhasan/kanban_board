import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';

enum TaskStatus { toDo, inProgress, done }

@freezed
class Task with _$Task {
  const factory Task({
    required String content,
    required String id,
    required DateTime createdAt,
    @Default([]) List<Comment> comments,
    @Default(TaskStatus.toDo) TaskStatus status,
  }) = _Task;
}

@freezed
class Comment with _$Comment {
  const factory Comment({
    required String content,
  }) = _Comment;
}
