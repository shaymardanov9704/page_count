// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChallengeModelAdapter extends TypeAdapter<ChallengeModel> {
  @override
  final int typeId = 4;

  @override
  ChallengeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChallengeModel(
      type: fields[0] as ChallengeType,
      beginDate: fields[1] as DateTime,
      endDate: fields[2] as DateTime,
      pages: (fields[3] as List).cast<PageModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, ChallengeModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.beginDate)
      ..writeByte(2)
      ..write(obj.endDate)
      ..writeByte(3)
      ..write(obj.pages);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChallengeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ChallengeTypeAdapter extends TypeAdapter<ChallengeType> {
  @override
  final int typeId = 3;

  @override
  ChallengeType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ChallengeType.Reading;
      case 1:
        return ChallengeType.Fitness;
      case 2:
        return ChallengeType.Learning;
      default:
        return ChallengeType.Reading;
    }
  }

  @override
  void write(BinaryWriter writer, ChallengeType obj) {
    switch (obj) {
      case ChallengeType.Reading:
        writer.writeByte(0);
        break;
      case ChallengeType.Fitness:
        writer.writeByte(1);
        break;
      case ChallengeType.Learning:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChallengeTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
