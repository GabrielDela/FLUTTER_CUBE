import 'dart:convert';
import 'dart:ui';

import 'package:cube/classes/modeles/modele_Ressource.dart';
import 'package:cube/classes/modeles/modele_Relation.dart';
import 'package:cube/classes/modeles/modele_Utilisateur.dart';
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

  static Future<Users> getUserById(String id) async {
    final response =
        await http.get(Uri.parse(base_url + "users/${id}"), headers: header);

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      final convert = Users.fromJson(parsed);
      return convert;
    } else {
      throw Exception(
          "Erreur dans la récupération des amis de l'utilisateur authController.getUserById(id)");
    }
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

//Ajout d'un ami avec les id de l'utilisateur loggé et l'utilisateur actuel
  static Future<bool> addAmi(String idFrom, String idTo) async {
    Map data = {"id_from": idFrom, "id_to": idTo};
    var body = json.encode(data);
    final response = await http.post(Uri.parse(base_url + "relations"),
        headers: header, body: body);
    return true;
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

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
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
      return parsed.map<Ressource>((json) => Ressource.fromJson(json)).toList();
    } else {
      throw Exception(
          "Erreur dans la récupération des ressources de l'utilisateur authController.getRessources");
    }
  }

  static Future<List<Ressource>> getFavorisByUser(String idUser) async {
    final response = await http.get(
        Uri.parse(base_url + "resources/user/${idUser}/favorites"),
        headers: header);

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Ressource>((json) => Ressource.fromJson(json)).toList();
    } else {
      throw Exception(
          "Erreur dans la récupération des ressources de l'utilisateur authController.getFavorisByUser");
    }
  }

  static Future<bool> postFavoris(String idUser, String idRessource) async {
    final response = await http.post(
        Uri.parse(base_url + "users/" + idUser + "/favorites/" + idRessource),
        headers: header);
    return true;
  }

  static Future<bool> deleteFavoris(String idUser, String idRessource) async {
    final response = await http.delete(
        Uri.parse(base_url + "users/" + idUser + "/favorites/" + idRessource),
        headers: header);
    return true;
  }

  static Future<bool> addUser(String mail, int age, String nom, String prenom,
      String mdp1, String mdp2) async {
    if ((nom.isEmpty && nom != null) ||
        (prenom.isEmpty && prenom != null) ||
        (mail.isEmpty && mail != null) ||
        (mdp1.isEmpty && mdp1 != null) ||
        (age > 15 && age != null) ||
        (mdp2.isEmpty && mdp2 != null) ||
        (mdp1 == mdp2)) {
      Map data = {
        "firstname": prenom,
        "age": age,
        "lastname": nom,
        "email": mail,
        "password": mdp1,
        "biography": "Bonjour je suis ${prenom} ${nom}"
      };
      var body = json.encode(data);
      final response = await http.post(Uri.parse(base_url + "users"),
          headers: header, body: body);
      return true;
    } else {
      return false;
    }
  }
}
