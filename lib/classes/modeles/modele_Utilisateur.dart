// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class UsersList {
  final List<Users> users;

  UsersList({required this.users});

  factory UsersList.fromJson(List<dynamic> parsedJson) {
    List<Users> users = parsedJson.map((i) => Users.fromJson(i)).toList();

    return new UsersList(
      users: users,
    );
  }
}

class Users {
  Users({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.tag,
    required this.biography,
    required this.role,
    // required this.favorites,
  });

  String id;
  String firstname;
  String lastname;
  String email;
  String tag;
  String biography;
  String role;
  // String favorites;

  factory Users.fromJson(Map<String, dynamic> json) => new Users(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        tag: json["tag"],
        biography: json["biography"],
        role: json["role"],
        // favorites: List<dynamic>.from(json["favorites"].map((x) => x)),
      );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "firstname": firstname,
  //       "lastname": lastname,
  //       "email": email,
  //       "tag": tag,
  //       "biography": biography,
  //       "role": role,
  //       "favorites": List<dynamic>.from(favorites.map((x) => x)),
  //     };
}
