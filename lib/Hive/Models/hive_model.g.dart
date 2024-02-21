// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartModelAdapter extends TypeAdapter<CartModel> {
  @override
  final int typeId = 0;

  @override
  CartModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartModel(
      id: fields[0] as int,
      title: fields[1] as String,
      price: fields[2] as int,
      initialprice: fields[6] as int,
      size: fields[3] as String,
      img: fields[5] as String,
      count: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CartModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.size)
      ..writeByte(4)
      ..write(obj.count)
      ..writeByte(5)
      ..write(obj.img)
      ..writeByte(6)
      ..write(obj.initialprice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FavItmsModelAdapter extends TypeAdapter<FavItmsModel> {
  @override
  final int typeId = 1;

  @override
  FavItmsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavItmsModel(
      title: fields[0] as String,
      price: fields[2] as int,
      img: fields[1] as String,
      id: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, FavItmsModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.img)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavItmsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
