import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthController {
  static String accessToken = "";
  static String refreshToken = "";
  static late dynamic user;
  static String base_url = "https://cube-api.glitch.me/api/";

  static dynamic header = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer ' + (accessToken != "" ? accessToken : refreshToken),
  };

  static setHeader() {
    header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ' + (accessToken != "" ? accessToken : refreshToken),
    };
  }

  static Future<bool> login(String email, String password) async {
    dynamic response = await http.post(Uri.parse(base_url + "auth/login"),
        headers: header,
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }));

    if (response.statusCode == 200) {
      dynamic json = jsonDecode(response.body);
      if (json != null) {
        accessToken = json["accessToken"];
        refreshToken = json["refreshToken"];
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
