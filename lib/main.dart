import 'package:cube/pages/page_actualite.dart';
import 'package:cube/pages/page_ami.dart';
import 'package:cube/pages/page_ami.dart';
import 'package:cube/pages/page_auth.dart';
import 'package:cube/pages/page_commentaire.dart';
import 'package:cube/pages/page_detailarticle.dart';
import 'package:cube/pages/page_editionProfil.dart';
import 'package:cube/pages/page_favoris.dart';
import 'package:cube/pages/page_home.dart';
import 'package:cube/pages/page_inscription.dart';
import 'package:cube/pages/page_monprofil.dart';
import 'package:cube/pages/page_parametre.dart';
import 'package:cube/pages/page_profil.dart';
import 'package:cube/pages/page_profilami.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'CUBE',
      // home: PageHome(),
      home: PageProfilAmi(),
      debugShowCheckedModeBanner: false,
    );
  }
}
