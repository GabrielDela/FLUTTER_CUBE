import 'package:cube/class/AuthController.dart';


import 'package:cube/LoginPage.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'CUBE',
      home: LoginPage(),// marche pas
      debugShowCheckedModeBanner: false,
    );
  }
}
