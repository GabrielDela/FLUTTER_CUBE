import 'dart:ffi';

import 'package:cube/classes/couleurs/classe_colors.dart';
import 'package:cube/classes/modeles/modele_Utilisateur.dart';
import 'package:cube/controller/authController.dart';
import 'package:flutter/material.dart';

class PageAmi extends StatefulWidget {
  const PageAmi({Key? key}) : super(key: key);

  @override
  _PageAmiState createState() => _PageAmiState();
}

class _PageAmiState extends State<PageAmi> {
  AuthController authController = new AuthController();
  List<Utilisateur> listeDesAmis = [];

  Future<List<Utilisateur>> Ami() async {
    //listeDesAmis = await AuthController.getAmis();
    return await AuthController.getAmis();
  }

  final List ListeAmi = [
    {
      'firstName': 'Roberts',
      'lastName': 'Nathan',
      'description': 'frère',
      'image': "assets/images/avatarmale.jpg"
    },
    {
      'firstName': 'Cooper',
      'lastName': 'Bessie',
      'description': 'Amie',
      'image': "assets/images/avatarfemale.jpg"
    },
    {
      'firstName': 'Roberts',
      'lastName': 'Nathan',
      'description': 'frère',
      'image': "assets/images/avatarmale.jpg"
    },
    {
      'firstName': 'Cooper',
      'lastName': 'Bessie',
      'description': 'Amie',
      'image': "assets/images/avatarfemale.jpg"
    },
    {
      'firstName': 'Roberts',
      'lastName': 'Nathan',
      'description': 'frère',
      'image': "assets/images/avatarmale.jpg"
    },
    {
      'firstName': 'Cooper',
      'lastName': 'Bessie',
      'description': 'Amie',
      'image': "assets/images/avatarfemale.jpg"
    },
    {
      'firstName': 'Roberts',
      'lastName': 'Nathan',
      'description': 'frère',
      'image': "assets/images/avatarmale.jpg"
    },
    {
      'firstName': 'Cooper',
      'lastName': 'Bessie',
      'description': 'Amie',
      'image': "assets/images/avatarfemale.jpg"
    },
    {
      'firstName': 'Roberts',
      'lastName': 'Nathan',
      'description': 'frère',
      'image': "assets/images/avatarmale.jpg"
    },
    {
      'firstName': 'Cooper',
      'lastName': 'Bessie',
      'description': 'Amie',
      'image': "assets/images/avatarfemale.jpg"
    },
    {
      'firstName': 'Roberts',
      'lastName': 'Nathan',
      'description': 'frère',
      'image': "assets/images/avatarmale.jpg"
    },
    {
      'firstName': 'Cooper',
      'lastName': 'Bessie',
      'description': 'Amie',
      'image': "assets/images/avatarfemale.jpg"
    },
    {
      'firstName': 'Roberts',
      'lastName': 'Nathan',
      'description': 'frère',
      'image': "assets/images/avatarmale.jpg"
    },
    {
      'firstName': 'Cooper',
      'lastName': 'Bessie',
      'description': 'Amie',
      'image': "assets/images/avatarfemale.jpg"
    },
    {
      'firstName': 'Roberts',
      'lastName': 'Nathan',
      'description': 'frère',
      'image': "assets/images/avatarmale.jpg"
    },
    {
      'firstName': 'Cooper',
      'lastName': 'Bessie',
      'description': 'Amie',
      'image': "assets/images/avatarfemale.jpg"
    },
  ];

  //pour la bare de recherche
  String search = "";
  @override
  void initState() {
    // _loadToken();
    print("HOURRRAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAH");
    Ami().then((value) {
      for (var ami in value) {
        listeDesAmis.add(ami);
        //print(ami.lastName);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      //évite lors de l'utilisation du clavier pour les champs texte les problèmes de bottom over flow sur les pages
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Mes Amis"),
        centerTitle: true,
        backgroundColor: CustomColors.MAIN_PURPLE,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.transparent,
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
          children: <Widget>[
            Container(
              //height: queryData.size.longestSide,
              color: Colors.grey.shade100,
              padding: EdgeInsets.fromLTRB(10, 25, 10, 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade400,
                                  blurRadius: 4,
                                  offset: Offset(0, 4)),
                            ],
                          ),
                          child: TextField(
                              decoration: InputDecoration(
                                  hintText: 'Nom',
                                  contentPadding: EdgeInsets.all(10),
                                  border: InputBorder.none),
                              onSubmitted: (value) {
                                setState(() {
                                  search = value;
                                  print(search);
                                });
                              }),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade400,
                                blurRadius: 4,
                                offset: Offset(0, 4)),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        //penser a rajouter fonction de search ICI
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.search,
                            size: 26,
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(10),
                              primary: CustomColors.MAIN_PURPLE),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    // height: 1000,
                    child: Column(
                        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // mainAxisSize: MainAxisSize.min,
                        //remplacer la col par un container pour avoir le SizedBox ?
                        children: [
                          for (var ami in listeDesAmis)
                            if (search == "" ||
                                ami.lastName.contains(search) ||
                                ami.firtsName.contains(search))
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Container(
                                  height: 70,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.white,
                                          blurRadius: 2,
                                          offset: Offset(0, 1)),
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.transparent,
                                        child: ClipOval(
                                          child: Image.asset(
                                            'assets/images/avatarfemale.jpg',
                                          ),
                                        ),
                                      ),
                                      Text(
                                        ami.firtsName + " " + ami.lastName,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text(ami.typeRelation,
                                          style: TextStyle(fontSize: 12)),
                                      Container(
                                        height: 40,
                                        width: queryData.size.width * 0.2,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Icon(
                                            Icons.delete,
                                            size: 20,
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              shape: CircleBorder(),
                                              padding: EdgeInsets.all(10),
                                              primary:
                                                  CustomColors.MAIN_PURPLE),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                        ]),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
