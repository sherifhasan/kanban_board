import 'package:hive/hive.dart';
import 'package:kanban_board/domain/models/task.dart';

part 'database_comment.g.dart';

@HiveType(typeId: 2)
class DatabaseComment extends HiveObject {
  @HiveField(0)
  final String content;

  DatabaseComment({required this.content});

  factory DatabaseComment.fromComment(Comment comment) {
    return DatabaseComment(
      content: comment.content,
    );
  }

  Comment toComment() {
    return Comment(
      content: content,
    );
  }
}
