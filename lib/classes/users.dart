import 'dart:convert';

class User {
  final String? id;
  final String? email;
  final String? firstName;
  final String? phoneNumber;
  final String? lastName;
  final String? profilePicture;

  User({
    this.id,
    this.email,
    this.firstName,
    this.phoneNumber,
    this.lastName,
    this.profilePicture,
  });

  User copyWith({
    String? id,
    String? email,
    String? firstName,
    String? phoneNumber,
    String? lastName,
    String? profilePicture,
  }) =>
      User(
        id: id ?? this.id,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        lastName: lastName ?? this.lastName,
        profilePicture: profilePicture ?? this.profilePicture,
      );

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        firstName: json["firstName"],
        phoneNumber: json["phoneNumber"],
        lastName: json["lastName"],
        profilePicture: json["profilePicture"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "firstName": firstName,
        "phoneNumber": phoneNumber,
        "lastName": lastName,
        "profilePicture": profilePicture,
      };
}
