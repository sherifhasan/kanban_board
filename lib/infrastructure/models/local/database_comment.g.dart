// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_comment.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DatabaseCommentAdapter extends TypeAdapter<DatabaseComment> {
  @override
  final int typeId = 2;

  @override
  DatabaseComment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DatabaseComment(
      content: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DatabaseComment obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatabaseCommentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
