// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imc_save.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImcSaveAdapter extends TypeAdapter<ImcSave> {
  @override
  final int typeId = 0;

  @override
  ImcSave read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImcSave(
      peso: fields[0] as double,
      altura: fields[1] as double,
      imc: fields[2] as double,
      classificacao: fields[3] as String,
      data: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ImcSave obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.peso)
      ..writeByte(1)
      ..write(obj.altura)
      ..writeByte(2)
      ..write(obj.imc)
      ..writeByte(3)
      ..write(obj.classificacao)
      ..writeByte(4)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImcSaveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
