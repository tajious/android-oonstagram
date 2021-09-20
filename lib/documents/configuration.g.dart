// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConfigurationAdapter extends TypeAdapter<Configuration> {
  @override
  final int typeId = 0;

  @override
  Configuration read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Configuration()..cdnUrl = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, Configuration obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.cdnUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConfigurationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
