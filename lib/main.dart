import 'package:cube/LoginPage.dart';
import 'package:cube/Router.dart';
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
      home: RouterPage(),
      // ICI mettez n'importe quel page avec le layoutCompoenent en base comme widget et vous pourrez naviguer partout
      debugShowCheckedModeBanner: false,
    );
  }
}
