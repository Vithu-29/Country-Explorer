// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CountryAdapter extends TypeAdapter<Country> {
  @override
  final int typeId = 0;

  @override
  Country read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Country(
      commonName: fields[0] as String,
      capital: (fields[1] as List).cast<String>(),
      region: fields[2] as String,
      population: fields[3] as int,
      flagPng: fields[4] as String,
      coatOfArmsPng: fields[5] as String?,
      timezones: (fields[6] as List).cast<String>(),
      languages: (fields[7] as Map?)?.cast<String, String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Country obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.commonName)
      ..writeByte(1)
      ..write(obj.capital)
      ..writeByte(2)
      ..write(obj.region)
      ..writeByte(3)
      ..write(obj.population)
      ..writeByte(4)
      ..write(obj.flagPng)
      ..writeByte(5)
      ..write(obj.coatOfArmsPng)
      ..writeByte(6)
      ..write(obj.timezones)
      ..writeByte(7)
      ..write(obj.languages);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
