// To parse this JSON data, do
//
//     final commentaire = commentaireFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Commentaire> commentaireFromJson(String str) => List<Commentaire>.from(
    json.decode(str).map((x) => Commentaire.fromJson(x)));

String commentaireToJson(List<Commentaire> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Commentaire {
  Commentaire({
    required this.id,
    required this.idResource,
    required this.idUser,
    required this.comment,
    required this.deleted,
    required this.createDate,
  });

  String id;
  String idResource;
  String idUser;
  String comment;
  bool deleted;
  DateTime createDate;

  factory Commentaire.fromJson(Map<String, dynamic> json) => Commentaire(
        id: json["_id"],
        idResource: json["id_resource"],
        idUser: json["id_user"],
        comment: json["comment"],
        deleted: json["deleted"],
        createDate: DateTime.parse(json["create_date"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "id_resource": idResource,
        "id_user": idUser,
        "comment": comment,
        "deleted": deleted,
        "create_date": createDate.toIso8601String(),
      };
}
