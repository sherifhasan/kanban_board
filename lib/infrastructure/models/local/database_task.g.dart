// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_task.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DatabaseTaskAdapter extends TypeAdapter<DatabaseTask> {
  @override
  final int typeId = 0;

  @override
  DatabaseTask read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DatabaseTask(
      id: fields[0] as String,
      content: fields[1] as String,
      createdAt: fields[2] as DateTime,
      status: fields[3] as TaskStatus,
      timeSpent: fields[4] as int,
      isTiming: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, DatabaseTask obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.timeSpent)
      ..writeByte(5)
      ..write(obj.isTiming);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatabaseTaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
