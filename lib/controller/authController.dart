import 'dart:convert';

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

    print(email);
    print(password);
    print(base_url);
    print(Uri.parse(base_url + "auth/login"));
    dynamic response = await http.post(Uri.parse(base_url + "auth/login"),
        headers: header,
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }));

    if (response.statusCode == 200) {
      dynamic json = jsonDecode(response.body);
      print(json);
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
}
