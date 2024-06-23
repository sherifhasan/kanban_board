// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskDto _$TaskDtoFromJson(Map<String, dynamic> json) {
  return _TaskDto.fromJson(json);
}

/// @nodoc
mixin _$TaskDto {
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'comment_count')
  int get commentCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_completed')
  bool get isCompleted => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  int get priority => throw _privateConstructorUsedError;
  @JsonKey(name: 'project_id')
  String get projectId => throw _privateConstructorUsedError;
  List<String> get labels => throw _privateConstructorUsedError;
  DateTime? get due => throw _privateConstructorUsedError;
  @JsonKey(name: 'section_id')
  String? get sectionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent_id')
  String? get parentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'creator_id')
  String get creatorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'assignee_id')
  String? get assigneeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'assigner_id')
  String? get assignerId => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskDtoCopyWith<TaskDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskDtoCopyWith<$Res> {
  factory $TaskDtoCopyWith(TaskDto value, $Res Function(TaskDto) then) =
      _$TaskDtoCopyWithImpl<$Res, TaskDto>;
  @useResult
  $Res call(
      {String id,
      String content,
      String description,
      @JsonKey(name: 'comment_count') int commentCount,
      @JsonKey(name: 'is_completed') bool isCompleted,
      int order,
      int priority,
      @JsonKey(name: 'project_id') String projectId,
      List<String> labels,
      DateTime? due,
      @JsonKey(name: 'section_id') String? sectionId,
      @JsonKey(name: 'parent_id') String? parentId,
      @JsonKey(name: 'creator_id') String creatorId,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'assignee_id') String? assigneeId,
      @JsonKey(name: 'assigner_id') String? assignerId,
      String url});
}

/// @nodoc
class _$TaskDtoCopyWithImpl<$Res, $Val extends TaskDto>
    implements $TaskDtoCopyWith<$Res> {
  _$TaskDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? description = null,
    Object? commentCount = null,
    Object? isCompleted = null,
    Object? order = null,
    Object? priority = null,
    Object? projectId = null,
    Object? labels = null,
    Object? due = freezed,
    Object? sectionId = freezed,
    Object? parentId = freezed,
    Object? creatorId = null,
    Object? createdAt = null,
    Object? assigneeId = freezed,
    Object? assignerId = freezed,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      labels: null == labels
          ? _value.labels
          : labels // ignore: cast_nullable_to_non_nullable
              as List<String>,
      due: freezed == due
          ? _value.due
          : due // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sectionId: freezed == sectionId
          ? _value.sectionId
          : sectionId // ignore: cast_nullable_to_non_nullable
              as String?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      assigneeId: freezed == assigneeId
          ? _value.assigneeId
          : assigneeId // ignore: cast_nullable_to_non_nullable
              as String?,
      assignerId: freezed == assignerId
          ? _value.assignerId
          : assignerId // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskDtoImplCopyWith<$Res> implements $TaskDtoCopyWith<$Res> {
  factory _$$TaskDtoImplCopyWith(
          _$TaskDtoImpl value, $Res Function(_$TaskDtoImpl) then) =
      __$$TaskDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String content,
      String description,
      @JsonKey(name: 'comment_count') int commentCount,
      @JsonKey(name: 'is_completed') bool isCompleted,
      int order,
      int priority,
      @JsonKey(name: 'project_id') String projectId,
      List<String> labels,
      DateTime? due,
      @JsonKey(name: 'section_id') String? sectionId,
      @JsonKey(name: 'parent_id') String? parentId,
      @JsonKey(name: 'creator_id') String creatorId,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'assignee_id') String? assigneeId,
      @JsonKey(name: 'assigner_id') String? assignerId,
      String url});
}

/// @nodoc
class __$$TaskDtoImplCopyWithImpl<$Res>
    extends _$TaskDtoCopyWithImpl<$Res, _$TaskDtoImpl>
    implements _$$TaskDtoImplCopyWith<$Res> {
  __$$TaskDtoImplCopyWithImpl(
      _$TaskDtoImpl _value, $Res Function(_$TaskDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? description = null,
    Object? commentCount = null,
    Object? isCompleted = null,
    Object? order = null,
    Object? priority = null,
    Object? projectId = null,
    Object? labels = null,
    Object? due = freezed,
    Object? sectionId = freezed,
    Object? parentId = freezed,
    Object? creatorId = null,
    Object? createdAt = null,
    Object? assigneeId = freezed,
    Object? assignerId = freezed,
    Object? url = null,
  }) {
    return _then(_$TaskDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      labels: null == labels
          ? _value._labels
          : labels // ignore: cast_nullable_to_non_nullable
              as List<String>,
      due: freezed == due
          ? _value.due
          : due // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sectionId: freezed == sectionId
          ? _value.sectionId
          : sectionId // ignore: cast_nullable_to_non_nullable
              as String?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      assigneeId: freezed == assigneeId
          ? _value.assigneeId
          : assigneeId // ignore: cast_nullable_to_non_nullable
              as String?,
      assignerId: freezed == assignerId
          ? _value.assignerId
          : assignerId // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskDtoImpl implements _TaskDto {
  const _$TaskDtoImpl(
      {required this.id,
      required this.content,
      this.description = '',
      @JsonKey(name: 'comment_count') this.commentCount = 0,
      @JsonKey(name: 'is_completed') this.isCompleted = false,
      this.order = 0,
      this.priority = 1,
      @JsonKey(name: 'project_id') required this.projectId,
      final List<String> labels = const [],
      this.due,
      @JsonKey(name: 'section_id') this.sectionId,
      @JsonKey(name: 'parent_id') this.parentId,
      @JsonKey(name: 'creator_id') required this.creatorId,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'assignee_id') this.assigneeId,
      @JsonKey(name: 'assigner_id') this.assignerId,
      required this.url})
      : _labels = labels;

  factory _$TaskDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String content;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey(name: 'comment_count')
  final int commentCount;
  @override
  @JsonKey(name: 'is_completed')
  final bool isCompleted;
  @override
  @JsonKey()
  final int order;
  @override
  @JsonKey()
  final int priority;
  @override
  @JsonKey(name: 'project_id')
  final String projectId;
  final List<String> _labels;
  @override
  @JsonKey()
  List<String> get labels {
    if (_labels is EqualUnmodifiableListView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_labels);
  }

  @override
  final DateTime? due;
  @override
  @JsonKey(name: 'section_id')
  final String? sectionId;
  @override
  @JsonKey(name: 'parent_id')
  final String? parentId;
  @override
  @JsonKey(name: 'creator_id')
  final String creatorId;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'assignee_id')
  final String? assigneeId;
  @override
  @JsonKey(name: 'assigner_id')
  final String? assignerId;
  @override
  final String url;

  @override
  String toString() {
    return 'TaskDto(id: $id, content: $content, description: $description, commentCount: $commentCount, isCompleted: $isCompleted, order: $order, priority: $priority, projectId: $projectId, labels: $labels, due: $due, sectionId: $sectionId, parentId: $parentId, creatorId: $creatorId, createdAt: $createdAt, assigneeId: $assigneeId, assignerId: $assignerId, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.commentCount, commentCount) ||
                other.commentCount == commentCount) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            const DeepCollectionEquality().equals(other._labels, _labels) &&
            (identical(other.due, due) || other.due == due) &&
            (identical(other.sectionId, sectionId) ||
                other.sectionId == sectionId) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.assigneeId, assigneeId) ||
                other.assigneeId == assigneeId) &&
            (identical(other.assignerId, assignerId) ||
                other.assignerId == assignerId) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      content,
      description,
      commentCount,
      isCompleted,
      order,
      priority,
      projectId,
      const DeepCollectionEquality().hash(_labels),
      due,
      sectionId,
      parentId,
      creatorId,
      createdAt,
      assigneeId,
      assignerId,
      url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskDtoImplCopyWith<_$TaskDtoImpl> get copyWith =>
      __$$TaskDtoImplCopyWithImpl<_$TaskDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskDtoImplToJson(
      this,
    );
  }
}

abstract class _TaskDto implements TaskDto {
  const factory _TaskDto(
      {required final String id,
      required final String content,
      final String description,
      @JsonKey(name: 'comment_count') final int commentCount,
      @JsonKey(name: 'is_completed') final bool isCompleted,
      final int order,
      final int priority,
      @JsonKey(name: 'project_id') required final String projectId,
      final List<String> labels,
      final DateTime? due,
      @JsonKey(name: 'section_id') final String? sectionId,
      @JsonKey(name: 'parent_id') final String? parentId,
      @JsonKey(name: 'creator_id') required final String creatorId,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'assignee_id') final String? assigneeId,
      @JsonKey(name: 'assigner_id') final String? assignerId,
      required final String url}) = _$TaskDtoImpl;

  factory _TaskDto.fromJson(Map<String, dynamic> json) = _$TaskDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get content;
  @override
  String get description;
  @override
  @JsonKey(name: 'comment_count')
  int get commentCount;
  @override
  @JsonKey(name: 'is_completed')
  bool get isCompleted;
  @override
  int get order;
  @override
  int get priority;
  @override
  @JsonKey(name: 'project_id')
  String get projectId;
  @override
  List<String> get labels;
  @override
  DateTime? get due;
  @override
  @JsonKey(name: 'section_id')
  String? get sectionId;
  @override
  @JsonKey(name: 'parent_id')
  String? get parentId;
  @override
  @JsonKey(name: 'creator_id')
  String get creatorId;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'assignee_id')
  String? get assigneeId;
  @override
  @JsonKey(name: 'assigner_id')
  String? get assignerId;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$TaskDtoImplCopyWith<_$TaskDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
