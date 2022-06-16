import 'package:meta/meta.dart';
import 'dart:convert';

List<Relations> relationsFromJson(String str) =>
    List<Relations>.from(json.decode(str).map((x) => Relations.fromJson(x)));

String relationsToJson(List<Relations> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Relations {
  Relations({
    required this.id,
    required this.idFrom,
    required this.idTo,
    required this.relation,
    required this.user,
  });

  String id;
  String idFrom;
  String idTo;
  String relation;
  User user;

  factory Relations.fromJson(Map<String, dynamic> json) => Relations(
        id: json["_id"],
        idFrom: json["id_from"],
        idTo: json["id_to"],
        relation: json["relation"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "id_from": idFrom,
        "id_to": idTo,
        "relation": relation,
        "user": user.toJson(),
      };
}

class User {
  User(
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
  String? avatar;
  List<dynamic>? favorites;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        tag: json["tag"],
        role: json["role"],
        biography: json["biography"],
        age: json["age"],
        avatar: json['avatar'],
        favorites: List<dynamic>.from(json["favorites"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "tag": tag,
        "role": role,
        "avatar": avatar,
        "favorites": List<dynamic>.from(favorites!.map((x) => x)),
      };
}
