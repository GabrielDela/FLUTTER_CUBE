import 'dart:convert';

import 'package:cube/classes/modeles/modele_Utilisateur.dart';
import 'package:cube/modeles/modele_Relation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static String token = "";
  static late dynamic user;
  static String base_url = "http://185.171.202.52:5000/api/";

  static dynamic header = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer ' + token,
  };

  static setHeader() {
    header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ' + token,
    };
  }

  static Future<bool> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();

    dynamic response = await http.post(Uri.parse(base_url + "auth/login"),
        headers: header,
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }));

    if (response.statusCode == 200) {
      dynamic json = jsonDecode(response.body);
      if (json != null) {
        token = json["token"];
        await prefs.setString('token', token);
        setHeader();
        return true;
      }
    }
    return false;
  }

  static Future<bool> me() async {
    dynamic response =
        await http.get(Uri.parse(base_url + "auth/me"), headers: header);

    print(response.body);
    return true;
  }

  static Future<List<Utilisateur>> getAmis() async {
    // List ListidAmi = [];
    List<Relation> listeRelations = [];
    dynamic response =
        await http.get(Uri.parse(base_url + "relations"), headers: header);
    print(response.body);
    List data = json.decode(response.body);
    for (var element in data) {
      Relation relationCourante = new Relation(
          idRelation: element['_id'],
          idFrom: element['id_from'],
          idTo: element['id_to'],
          typeRelation: element['relation']);
      listeRelations.add(relationCourante);
      // ListidAmi.add(element['id_to']);
    }

    List listeRelationCastee = await listeRelations;
    List<Utilisateur> listUtilisateur = [];

    for (var relation in listeRelationCastee) {
      print(relation.idTo);
      dynamic response = await http
          .get(Uri.parse(base_url + "users/${relation.idTo}"), headers: header);
      var json = jsonDecode(response.body);
      Utilisateur utilisateurCourant = new Utilisateur(
          id: json['_id'],
          activated: json['activated'],
          firtsName: json['firstname'],
          lastName: json['lastname'],
          tag: json['tag'],
          email: json['email'],
          password: json['password'],
          role: json['role'],
          typeRelation: relation.typeRelation);
      listUtilisateur.add(utilisateurCourant);
    }
    return listUtilisateur;
  }
}
