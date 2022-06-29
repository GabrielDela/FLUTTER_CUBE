import 'package:cube/pages/page_ami.dart';
import 'package:cube/pages/page_auth.dart';
import 'package:cube/pages/page_commentaire.dart';
import 'package:cube/pages/page_favoris.dart';
import 'package:cube/pages/page_inscription.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    // This makes the visual density adapt to the platform that you run
    // the app on. For desktop platforms, the controls will be smaller and
    // closer together (more dense) than on mobile platforms.
    visualDensity:
    VisualDensity.adaptivePlatformDensity;
    return MaterialApp(
      title: 'CUBE',
      // home: PageHome(),
      home: PageAuth(),
      routes: {
        '/amis': (context) => PageAmi(),
        '/favoris': (context) => PageFavoris(),
        '/inscription': (context) => PageInscription(),
        '/commentaires': (context) => PageCommentaire(idRessource: null)
        // '/profil_ami': (context) => PageProfilAmi(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
