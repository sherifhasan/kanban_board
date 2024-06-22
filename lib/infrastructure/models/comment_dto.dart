import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban_board/domain/models/task.dart';

part 'comment_dto.freezed.dart';

part 'comment_dto.g.dart';

@freezed
class CommentDto with _$CommentDto {
  const factory CommentDto({
    required String content,
    String? id,
    @JsonKey(name: 'task_id') required String taskId,
    @JsonKey(name: 'posted_at') required String? postedAt,
    @JsonKey(name: 'project_id') String? projectId,
    @JsonKey(includeIfNull: false) AttachmentDto? attachment,
  }) = _CommentDto;

  factory CommentDto.fromJson(Map<String, dynamic> json) =>
      _$CommentDtoFromJson(json);
}

@freezed
class AttachmentDto with _$AttachmentDto {
  const factory AttachmentDto({
    @JsonKey(name: 'file_name') required String fileName,
    @JsonKey(name: 'file_type') required String fileType,
    @JsonKey(name: 'file_url') required String fileUrl,
    @JsonKey(name: 'resource_type') required String resourceType,
  }) = _AttachmentDto;

  factory AttachmentDto.fromJson(Map<String, dynamic> json) =>
      _$AttachmentDtoFromJson(json);
}

extension CommentDtoX on CommentDto {
  Comment toDomain() {
    return Comment(
      content: content,
    );
  }
}
