// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StoryResponseAdapter extends TypeAdapter<StoryResponse> {
  @override
  final int typeId = 1;

  @override
  StoryResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StoryResponse(
      id: fields[0] as String,
      object: fields[2] as String,
      created: fields[3] as int,
      model: fields[4] as String,
      choices: (fields[5] as List).cast<Choice>(),
      usage: fields[6] as Usage,
    );
  }

  @override
  void write(BinaryWriter writer, StoryResponse obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.object)
      ..writeByte(3)
      ..write(obj.created)
      ..writeByte(4)
      ..write(obj.model)
      ..writeByte(5)
      ..write(obj.choices)
      ..writeByte(6)
      ..write(obj.usage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StoryResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ChoiceAdapter extends TypeAdapter<Choice> {
  @override
  final int typeId = 2;

  @override
  Choice read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Choice(
      index: fields[0] as int,
      message: fields[1] as Message,
      finishReason: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Choice obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.index)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(3)
      ..write(obj.finishReason);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChoiceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MessageAdapter extends TypeAdapter<Message> {
  @override
  final int typeId = 3;

  @override
  Message read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Message(
      role: fields[0] as String,
      content: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Message obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.role)
      ..writeByte(1)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UsageAdapter extends TypeAdapter<Usage> {
  @override
  final int typeId = 4;

  @override
  Usage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Usage(
      promptTokens: fields[0] as int,
      completionTokens: fields[1] as int,
      totalTokens: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Usage obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.promptTokens)
      ..writeByte(1)
      ..write(obj.completionTokens)
      ..writeByte(2)
      ..write(obj.totalTokens);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
