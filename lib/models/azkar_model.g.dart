// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'azkar_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AzkarModelAdapter extends TypeAdapter<AzkarModel> {
  @override
  final int typeId = 0;

  @override
  AzkarModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AzkarModel(
      title: fields[0] as String,
      arabic: fields[1] as String,
      meaning: fields[2] as String,
      dailyCount: fields[3] as int,
      totalCount: fields[4] as int,
      isCustom: fields[5] as bool,
      lastUpdated: fields[6] as DateTime,
      targetCount: fields[7] as int,
      category: fields[8] as String,
      isFavorite: fields[9] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, AzkarModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.arabic)
      ..writeByte(2)
      ..write(obj.meaning)
      ..writeByte(3)
      ..write(obj.dailyCount)
      ..writeByte(4)
      ..write(obj.totalCount)
      ..writeByte(5)
      ..write(obj.isCustom)
      ..writeByte(6)
      ..write(obj.lastUpdated)
      ..writeByte(7)
      ..write(obj.targetCount)
      ..writeByte(8)
      ..write(obj.category)
      ..writeByte(9)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AzkarModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
