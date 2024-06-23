// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentDtoImpl _$$CommentDtoImplFromJson(Map<String, dynamic> json) =>
    _$CommentDtoImpl(
      content: json['content'] as String,
      id: json['id'] as String?,
      taskId: json['task_id'] as String,
      postedAt: json['posted_at'] as String?,
      projectId: json['project_id'] as String?,
      attachment: json['attachment'] == null
          ? null
          : AttachmentDto.fromJson(json['attachment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CommentDtoImplToJson(_$CommentDtoImpl instance) {
  final val = <String, dynamic>{
    'content': instance.content,
    'id': instance.id,
    'task_id': instance.taskId,
    'posted_at': instance.postedAt,
    'project_id': instance.projectId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('attachment', instance.attachment);
  return val;
}

_$AttachmentDtoImpl _$$AttachmentDtoImplFromJson(Map<String, dynamic> json) =>
    _$AttachmentDtoImpl(
      fileName: json['file_name'] as String,
      fileType: json['file_type'] as String,
      fileUrl: json['file_url'] as String,
      resourceType: json['resource_type'] as String,
    );

Map<String, dynamic> _$$AttachmentDtoImplToJson(_$AttachmentDtoImpl instance) =>
    <String, dynamic>{
      'file_name': instance.fileName,
      'file_type': instance.fileType,
      'file_url': instance.fileUrl,
      'resource_type': instance.resourceType,
    };
