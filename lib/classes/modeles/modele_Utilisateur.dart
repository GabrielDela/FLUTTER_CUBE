// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Users {
  Users(
      {required this.id,
      required this.firstname,
      required this.lastname,
      required this.email,
      required this.tag,
      required this.role,
      this.favorites,
      this.biography,
      this.age,
      this.avatar});

  String id;
  String firstname;
  String lastname;
  String email;
  String tag;
  String role;
  String? biography;
  int? age;
  List<dynamic>? favorites;
  String? avatar;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
      id: json["id"],
      firstname: json["firstname"],
      lastname: json["lastname"],
      email: json["email"],
      tag: json["tag"],
      role: json["role"],
      biography: json["biography"],
      age: json["age"],
      favorites: List<dynamic>.from(json["favorites"].map((x) => x)),
      avatar: json["avatar"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "tag": tag,
        "role": role,
        "favorites": List<dynamic>.from(favorites!.map((x) => x)),
        "avatar": avatar
      };
}
