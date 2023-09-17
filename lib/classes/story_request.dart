import 'dart:convert';

class StoryRequest {
  final String model;
  final List<Message> messages;
  final double temperature;

  StoryRequest({
    required this.model,
    required this.messages,
    required this.temperature,
  });

  factory StoryRequest.defaultStory() => StoryRequest(
        model: 'gpt-3.5-turbo',
        messages: [
          Message(
              role: 'system',
              content:
                  'You are a children\'s Story teller. Tell a story in 500 words. Themes can be either lovely mother or caring father or loving grandmother.'),
          // Message(
          // role: 'system', content: 'You are a children\'s Story teller.')
        ],
        temperature: 0.5,
      );

  StoryRequest copyWith({
    String? model,
    List<Message>? messages,
    double? temperature,
  }) =>
      StoryRequest(
        model: model ?? this.model,
        messages: messages ?? this.messages,
        temperature: temperature ?? this.temperature,
      );

  factory StoryRequest.fromRawJson(String str) =>
      StoryRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StoryRequest.fromJson(Map<String, dynamic> json) => StoryRequest(
        model: json["model"],
        messages: List<Message>.from(
            json["messages"].map((x) => Message.fromJson(x))),
        temperature: json["temperature"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
        "temperature": temperature,
      };
}

class Message {
  final String role;
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
