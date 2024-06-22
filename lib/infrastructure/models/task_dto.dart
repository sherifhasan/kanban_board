import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_dto.freezed.dart';

part 'task_dto.g.dart';

enum TaskStatus { todo, inProgress, done }

@freezed
class TaskDto with _$TaskDto {
  const factory TaskDto({
    required String id,
    required String content,
    @Default('') String description,
    @JsonKey(name: 'comment_count') @Default(0) int commentCount,
    @JsonKey(name: 'is_completed') @Default(false) bool isCompleted,
    @Default(0) int order,
    @Default(1) int priority,
    @JsonKey(name: 'project_id') required String projectId,
    @Default([]) List<String> labels,
    DateTime? due,
    @JsonKey(name: 'section_id') String? sectionId,
    @JsonKey(name: 'parent_id') String? parentId,
    @JsonKey(name: 'creator_id') required String creatorId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'assignee_id') String? assigneeId,
    @JsonKey(name: 'assigner_id') String? assignerId,
    required String url,
  }) = _TaskDto;

  factory TaskDto.fromJson(Map<String, dynamic> json) =>
      _$TaskDtoFromJson(json);
}
