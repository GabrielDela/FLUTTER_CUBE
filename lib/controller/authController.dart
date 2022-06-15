import 'dart:convert';

import 'package:cube/classes/modeles/modele_Ressource.dart';
import 'package:cube/classes/modeles/modele_Relation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static String token = "";
  static late dynamic user;
  static String base_url = "http://185.171.202.52:5000/api/";

  static dynamic header = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'Charset': 'utf-8',
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

    dynamic json = jsonDecode(response.body);
    if (json != null) {
      token = json["token"];
      await prefs.setString('token', token);
      setHeader();
      return true;
    }
    return false;
  }

  static Future<dynamic> me() async {
    final prefs = await SharedPreferences.getInstance();

    var response =
        await http.get(Uri.parse(base_url + "auth/me"), headers: header);
    var data = json.decode(response.body);
    await prefs.setString("userId", data["user"]["user"]["_id"]);
    return data;
  }

  //Récupération des amis avec l'id de la personne
  static Future<List<Relations>> getAmis(String id) async {
    //Réutilisation du token dans les sharedPreferences
    final prefs = await SharedPreferences.getInstance();
    String? leTOKEN = prefs.getString('token');
    token = leTOKEN!;
    setHeader();

    final response = await http
        .get(Uri.parse(base_url + "relations/friends/" + id), headers: header);

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Relations>((json) => Relations.fromJson(json)).toList();
    } else {
      throw Exception(
          "Erreur dans la récupération des amis de l'utilisateur authController.getAmis(id)");
    }
  }

  //Suppression d'un ami avec l'id de la relation
  static Future<bool> deleteAmi(String idRelation) async {
    dynamic response = await http.delete(
        Uri.parse(base_url + "relations/" + idRelation),
        headers: header);

    return true;
  }

  static Future<int> getNumberAmis(String id) async {
    int nombreRelations = 0;
    List<Relations> lesAmis = await getAmis(id);
    nombreRelations = lesAmis.length;
    return nombreRelations;
  }

  static Future<List<Ressource>> getRessourcesUser(String id) async {
    final response = await http
        .get(Uri.parse(base_url + "resources/user/" + id), headers: header);
    print("RESPONSE");
    print(response.body);

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      print("LUNE");
      print(parsed);
      return parsed.map<Ressource>((json) => Ressource.fromJson(json)).toList();
    } else {
      throw Exception(
          "Erreur dans la récupération des ressources de l'utilisateur authController.getRessourcesUser(id)");
    }
  }

  static Future<List<Ressource>> getRessources() async {
    final response =
        await http.get(Uri.parse(base_url + "resources"), headers: header);

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      print("SOLEIL");
      print(parsed);
      return parsed.map<Ressource>((json) => Ressource.fromJson(json)).toList();
    } else {
      throw Exception(
          "Erreur dans la récupération des ressources de l'utilisateur authController.getRessources");
    }
  }
}
