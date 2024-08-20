// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PageModelAdapter extends TypeAdapter<PageModel> {
  @override
  final int typeId = 2;

  @override
  PageModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PageModel(
      name: fields[0] as String,
      pageNumber: fields[1] as int,
      firstHalfCount: fields[2] as int?,
      secondHalfCount: fields[3] as int?,
      firstHalfGoal: fields[4] as int?,
      secondHalfGoal: fields[5] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, PageModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.pageNumber)
      ..writeByte(2)
      ..write(obj.firstHalfCount)
      ..writeByte(3)
      ..write(obj.secondHalfCount)
      ..writeByte(4)
      ..write(obj.firstHalfGoal)
      ..writeByte(5)
      ..write(obj.secondHalfGoal);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PageModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
