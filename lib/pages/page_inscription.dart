import 'package:cube/controller/authController.dart';
import 'package:cube/pages/page_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cube/classes/couleurs/classe_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PageInscription extends StatefulWidget {
  const PageInscription({Key? key}) : super(key: key);

  @override
  _PageInscriptionState createState() => _PageInscriptionState();
}

class _PageInscriptionState extends State<PageInscription> {
  TextEditingController mail = new TextEditingController();
  TextEditingController age = new TextEditingController();
  TextEditingController nom = new TextEditingController();
  TextEditingController prenom = new TextEditingController();
  TextEditingController mdp1 = new TextEditingController();
  TextEditingController mdp2 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      //évite lors de l'utilisation du clavier pour les champs texte les problèmes de bottom over flow sur les pages
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.MAIN_PURPLE,
        title: Text("Inscription"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 50,
              color: CustomColors.MAIN_PURPLE,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                      child: Text(
                    "Vos informations",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                        color: Colors.white),
                  ))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 240,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Container(
                      width: queryData.size.width * 0.7,
                      padding: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        controller: mail,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black),
                            ),
                            hintText: 'votremail@mail.fr',
                            hintStyle: TextStyle(color: Colors.black),
                            contentPadding: EdgeInsets.all(10),
                            enabled: true),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: queryData.size.width * 0.7,
                      padding: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        controller: age,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black),
                            ),
                            hintText: 'Age',
                            hintStyle: TextStyle(color: Colors.black),
                            contentPadding: EdgeInsets.all(10),
                            enabled: true),
                      ),
                    ),
                  ),
                  Flexible(
                      child: Container(
                    width: queryData.size.width * 0.6,
                    padding: EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      controller: nom,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.black),
                          ),
                          hintText: 'Nom',
                          hintStyle: TextStyle(color: Colors.black),
                          contentPadding: EdgeInsets.all(10),
                          enabled: true),
                    ),
                  )),
                  Flexible(
                    child: Container(
                      width: queryData.size.width * 0.6,
                      padding: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        controller: prenom,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black),
                            ),
                            hintText: 'Prénom',
                            hintStyle: TextStyle(color: Colors.black),
                            contentPadding: EdgeInsets.all(10),
                            enabled: true),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 240,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Text(
                      "Création mot de passe",
                      style: TextStyle(
                          color: CustomColors.MAIN_PURPLE,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Flexible(
                    child: Container(
                      width: queryData.size.width * 0.8,
                      padding: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        controller: mdp1,
                        obscureText: true,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black),
                            ),
                            hintText: '*********',
                            hintStyle: TextStyle(color: Colors.black),
                            contentPadding: EdgeInsets.all(10),
                            enabled: true),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: queryData.size.width * 0.8,
                      padding: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        controller: mdp2,
                        obscureText: true,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black),
                            ),
                            hintText: '*********',
                            hintStyle: TextStyle(color: Colors.black),
                            contentPadding: EdgeInsets.all(10),
                            enabled: true),
                      ),
                    ),
                  ),
                  Flexible(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.green,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        textStyle: TextStyle(
                            fontSize: 15, color: CustomColors.MAIN_PURPLE),
                      ),
                      onPressed: () {
                        print("LE PRINT INSCRIPTION");
                        var result = AuthController.addUser(
                            mail.text,
                            int.parse(age.text),
                            nom.text,
                            prenom.text,
                            mdp1.text,
                            mdp2.text);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PageAuth(),
                          ),
                        );
                      },
                      child: Text(
                        "Sauvegarder",
                        style: TextStyle(color: CustomColors.MAIN_PURPLE),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
