// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskDtoImpl _$$TaskDtoImplFromJson(Map<String, dynamic> json) =>
    _$TaskDtoImpl(
      id: json['id'] as String,
      content: json['content'] as String,
      description: json['description'] as String? ?? '',
      commentCount: (json['comment_count'] as num?)?.toInt() ?? 0,
      isCompleted: json['is_completed'] as bool? ?? false,
      order: (json['order'] as num?)?.toInt() ?? 0,
      priority: (json['priority'] as num?)?.toInt() ?? 1,
      projectId: json['project_id'] as String,
      labels: (json['labels'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      due: json['due'] == null ? null : DateTime.parse(json['due'] as String),
      sectionId: json['section_id'] as String?,
      parentId: json['parent_id'] as String?,
      creatorId: json['creator_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      assigneeId: json['assignee_id'] as String?,
      assignerId: json['assigner_id'] as String?,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$TaskDtoImplToJson(_$TaskDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'description': instance.description,
      'comment_count': instance.commentCount,
      'is_completed': instance.isCompleted,
      'order': instance.order,
      'priority': instance.priority,
      'project_id': instance.projectId,
      'labels': instance.labels,
      'due': instance.due?.toIso8601String(),
      'section_id': instance.sectionId,
      'parent_id': instance.parentId,
      'creator_id': instance.creatorId,
      'created_at': instance.createdAt.toIso8601String(),
      'assignee_id': instance.assigneeId,
      'assigner_id': instance.assignerId,
      'url': instance.url,
    };
