// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fav_quote.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavQuoteAdapter extends TypeAdapter<FavQuote> {
  @override
  final int typeId = 1;

  @override
  FavQuote read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavQuote(
      quote: fields[0] as String,
      author: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavQuote obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.quote)
      ..writeByte(1)
      ..write(obj.author);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavQuoteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
