// To parse this JSON data, do
//
//     final ressource = ressourceFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Ressource> ressourceFromJson(String str) =>
    List<Ressource>.from(json.decode(str).map((x) => Ressource.fromJson(x)));

String ressourceToJson(List<Ressource> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Ressource {
  Ressource({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    this.content,
    required this.userId,
    required this.likes,
    required this.share,
    required this.categoryId,
    required this.typeId,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
  });

  String id;
  String title;
  String description;
  String image;
  String? content;
  String userId;
  int likes;
  int share;
  dynamic? categoryId;
  dynamic? typeId;
  DateTime createdAt;
  DateTime updatedAt;
  String status;

  factory Ressource.fromJson(Map<String, dynamic> json) {
    print(json);
    return Ressource(
      id: json["_id"] as String,
      title: json["title"] as String,
      description: json["description"] as String,
      image: json["image"] as String,
      content: json["content"] as String?,
      userId: json["user_id"] as String,
      likes: json["likes"] as int,
      share: json["share"] as int,
      categoryId: json["category_id"] as String?,
      typeId: json["type_id"] as String?,
      createdAt: DateTime.parse(json["created_at"]) as DateTime,
      updatedAt: DateTime.parse(json["updated_at"]) as DateTime,
      status: json["status"] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "image": image,
        "content": content,
        "user_id": userId,
        "likes": likes,
        "share": share,
        "category_id": categoryId,
        "type_id": typeId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "status": status,
      };
}
