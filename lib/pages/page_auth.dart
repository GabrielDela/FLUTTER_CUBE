import 'package:cube/classes/couleurs/classe_colors.dart';
import 'package:cube/controller/authController.dart';
import 'package:cube/pages/page_accueil.dart';
import 'package:cube/pages/page_actualite.dart';
import 'package:cube/pages/page_favoris.dart';
import 'package:flutter/material.dart';

class PageAuth extends StatefulWidget {
  const PageAuth({Key? key}) : super(key: key);

  @override
  _PageAuthState createState() => _PageAuthState();
}

class _PageAuthState extends State<PageAuth> {
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //évite lors de l'utilisation du clavier pour les champs texte les problèmes de bottom over flow sur les pages
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomColors.MAIN_PURPLE,
      body: Container(
        margin: const EdgeInsets.all(30),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 50),
              width: MediaQuery.of(context).size.width,
              child: const Text(
                "Connectez-vous à CUBE",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 25),
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: OutlinedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.only(left: 70, right: 70),
                  ),
                  side: MaterialStateProperty.all(const BorderSide(
                      color: Colors.black87,
                      width: 1,
                      style: BorderStyle.solid)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0))),
                ),
                onPressed: () => {},
                child: const Text(
                  'Se connecter avec Google',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 25, bottom: 25),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 2,
                    color: Colors.white10,
                    width: MediaQuery.of(context).size.width / 4,
                  ),
                  const Text(
                    'OU',
                    style: TextStyle(color: Colors.white54, fontSize: 18),
                  ),
                  Container(
                    height: 2,
                    color: Colors.white10,
                    width: MediaQuery.of(context).size.width / 4,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, bottom: 15),
              child: TextField(
                onChanged: (text) {
                  email = text;
                },
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w100),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white54, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white24, width: 2.0),
                  ),
                  hintText: "Email",
                  hintStyle: TextStyle(fontSize: 18, color: Colors.white54),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 0, bottom: 15),
              child: TextField(
                onChanged: (text) {
                  password = text;
                },
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w100),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white54, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white24, width: 2.0),
                  ),
                  hintText: "Mot de passe",
                  hintStyle: TextStyle(fontSize: 18, color: Colors.white54),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: OutlinedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.only(left: 70, right: 70),
                  ),
                  side: MaterialStateProperty.all(const BorderSide(
                      color: Colors.black87,
                      width: 1,
                      style: BorderStyle.solid)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0))),
                ),
                onPressed: () => {Login()},
                child: const Text(
                  'Suivant',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: OutlinedButton(
                style: ButtonStyle(
                  // backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.only(left: 70, right: 70),
                  ),
                  side: MaterialStateProperty.all(const BorderSide(
                      color: Colors.white30,
                      width: 2,
                      style: BorderStyle.solid)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0))),
                ),
                onPressed: () => {},
                child: const Text(
                  'Mot de passe oublié ?',
                  style: TextStyle(color: Colors.white54, fontSize: 18),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width,
              child: const Text("Vous n'avez pas de compte ?",
                  style: TextStyle(color: Colors.white54, fontSize: 18)),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  null;
                },
                child: const Text(
                  "Inscrivez-vous",
                  style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Login() async {
    bool response = false;
    response = await AuthController.login(email, password);
    if (response) {
      response = await AuthController.me();
      if (response) {
        Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => PageFavoris()),
        );
      } else {
        print("N'arrive pas a retrouver l'utilisateur en bdd ?");
      }
    } else {
      print("Pas log pas pas bon credentials");
    }
  }
}
