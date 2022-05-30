import 'package:cube/classes/couleurs/classe_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PageParametre extends StatefulWidget {
  const PageParametre({Key? key}) : super(key: key);

  @override
  _PageParametreState createState() => _PageParametreState();
}

class _PageParametreState extends State<PageParametre> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      //évite lors de l'utilisation du clavier pour les champs texte les problèmes de bottom over flow sur les pages
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Gestion des paramètres"),
        centerTitle: true,
        backgroundColor: CustomColors.MAIN_PURPLE,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/avatarmale2.jpg',
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 50,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      "Paramètres du compte",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                          color: CustomColors.MAIN_PURPLE),
                    ),
                  )
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
                      width: queryData.size.width * 0.8,
                      padding: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black),
                            ),
                            hintText: 'NathanRoberts@mail.fr',
                            hintStyle: TextStyle(color: Colors.black),
                            contentPadding: EdgeInsets.all(10),
                            enabled: false),
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
                      width: queryData.size.width * 0.8,
                      padding: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
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
                  Flexible(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.green,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        textStyle: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      onPressed: () {},
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
            Container(
              height: 240,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Text(
                      "Changer de mot de passe",
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
                      onPressed: () {},
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
            Container(
              height: 150,
              width: queryData.size.width * 0.9, //500,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Text(
                      "Gestion du compte",
                      style: TextStyle(
                          color: CustomColors.MAIN_PURPLE,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Flexible(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.orangeAccent,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        textStyle: TextStyle(fontSize: 15, color: Colors.red),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Désactiver le compte",
                        style: TextStyle(color: CustomColors.MAIN_PURPLE),
                      ),
                    ),
                  ),
                  Flexible(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.red,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        textStyle: TextStyle(
                            fontSize: 15, color: CustomColors.MAIN_PURPLE),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Supprimer le compte",
                        style: TextStyle(color: CustomColors.MAIN_PURPLE),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
