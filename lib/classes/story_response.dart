import 'dart:convert';
import 'package:bedtime_stories/ui/common/app_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'story_response.g.dart';

@HiveType(typeId: storyResponseTypeId)
class StoryResponse {
  @HiveField(0)
  final String id;
  @HiveField(2)
  final String object;
  @HiveField(3)
  final int created;
  @HiveField(4)
  final String model;
  @HiveField(5)
  final List<Choice> choices;
  @HiveField(6)
  final Usage usage;

  StoryResponse({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
    required this.usage,
  });

  StoryResponse copyWith({
    String? id,
    String? object,
    int? created,
    String? model,
    List<Choice>? choices,
    Usage? usage,
  }) =>
      StoryResponse(
        id: id ?? this.id,
        object: object ?? this.object,
        created: created ?? this.created,
        model: model ?? this.model,
        choices: choices ?? this.choices,
        usage: usage ?? this.usage,
      );

  factory StoryResponse.fromRawJson(String str) =>
      StoryResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StoryResponse.fromJson(Map<String, dynamic> json) => StoryResponse(
        id: json["id"],
        object: json["object"],
        created: json["created"],
        model: json["model"],
        choices:
            List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
        usage: Usage.fromJson(json["usage"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "object": object,
        "created": created,
        "model": model,
        "choices": List<dynamic>.from(choices.map((x) => x.toJson())),
        "usage": usage.toJson(),
      };
}

@HiveType(typeId: storyResponseChoiceTypeId)
class Choice {
  @HiveField(0)
  final int index;
  @HiveField(1)
  final Message message;
  @HiveField(3)
  final String finishReason;

  Choice({
    required this.index,
    required this.message,
    required this.finishReason,
  });

  Choice copyWith({
    int? index,
    Message? message,
    String? finishReason,
  }) =>
      Choice(
        index: index ?? this.index,
        message: message ?? this.message,
        finishReason: finishReason ?? this.finishReason,
      );

  factory Choice.fromRawJson(String str) => Choice.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        index: json["index"],
        message: Message.fromJson(json["message"]),
        finishReason: json["finish_reason"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "message": message.toJson(),
        "finish_reason": finishReason,
      };
}

@HiveType(typeId: storyResponseMessageTypeId)
class Message {
  @HiveField(0)
  final String role;
  @HiveField(1)
  final String content;

  Message({
    required this.role,
    required this.content,
  });

  Message copyWith({
    String? role,
    String? content,
  }) =>
      Message(
        role: role ?? this.role,
        content: content ?? this.content,
      );

  factory Message.fromRawJson(String str) => Message.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        role: json["role"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "content": content,
      };
}

@HiveType(typeId: storyResponseUsageTypeId)
class Usage {
  @HiveField(0)
  final int promptTokens;
  @HiveField(1)
  final int completionTokens;
  @HiveField(2)
  final int totalTokens;

  Usage({
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
  });

  Usage copyWith({
    int? promptTokens,
    int? completionTokens,
    int? totalTokens,
  }) =>
      Usage(
        promptTokens: promptTokens ?? this.promptTokens,
        completionTokens: completionTokens ?? this.completionTokens,
        totalTokens: totalTokens ?? this.totalTokens,
      );

  factory Usage.fromRawJson(String str) => Usage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Usage.fromJson(Map<String, dynamic> json) => Usage(
        promptTokens: json["prompt_tokens"],
        completionTokens: json["completion_tokens"],
        totalTokens: json["total_tokens"],
      );

  Map<String, dynamic> toJson() => {
        "prompt_tokens": promptTokens,
        "completion_tokens": completionTokens,
        "total_tokens": totalTokens,
      };
}
