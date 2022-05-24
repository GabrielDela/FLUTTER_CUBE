import 'package:flutter/cupertino.dart';
import 'package:cube/classes/couleurs/classe_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PageSubscribe extends StatefulWidget {
  const PageSubscribe({Key? key}) : super(key: key);

  @override
  _PageSubscribeState createState() => _PageSubscribeState();
}

class _PageSubscribeState extends State<PageSubscribe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "vos informations",
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
                      width: 300,
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
                            hintText: 'votremail@mail.fr',
                            hintStyle: TextStyle(color: Colors.black),
                            contentPadding: EdgeInsets.all(10),
                            enabled: true),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: 300,
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
                            hintText: 'votre tag',
                            hintStyle: TextStyle(color: Colors.black),
                            contentPadding: EdgeInsets.all(10),
                            enabled: false),
                      ),
                    ),
                  ),
                  Flexible(
                      child: Container(
                    width: 300,
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
                      width: 300,
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
                      width: 300,
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
                      width: 300,
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
          ],
        ),
      ),
    );
  }
}
