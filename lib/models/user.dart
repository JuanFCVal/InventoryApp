// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  String email;
  int id;
  bool isAdmin;
  String lastName;
  String name;
  String password;
  String profilePicture;
  String username;

  User({
    required this.email,
    required this.id,
    required this.isAdmin,
    required this.lastName,
    required this.name,
    required this.password,
    required this.profilePicture,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        id: json["id"],
        isAdmin: json["isAdmin"],
        lastName: json["lastName"],
        name: json["name"],
        password: json["password"],
        profilePicture: json["profilePicture"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "id": id,
        "isAdmin": isAdmin,
        "lastName": lastName,
        "name": name,
        "password": password,
        "profilePicture": profilePicture,
        "username": username,
      };
}
