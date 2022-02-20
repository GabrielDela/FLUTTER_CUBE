import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:cube/class/HttpClient.dart';
import 'package:cube/class/AuthController.dart';

class Friends {

    static String base_url = HttpClient.url;

    static Future<dynamic> GetFriends(String id) async {
        
        print("Access token : " + AuthController.accessToken);
        if(AuthController.accessToken != "" || AuthController.accessToken != null){
            dynamic response = await http.get(Uri.parse(base_url + "users/friends/" + id));
            print("reponseeee : " + response.body);
            if(response.statusCode == 200 && response != null){
                print(response.body);
                return response.body;
            }
        }
        return [];
    }
}