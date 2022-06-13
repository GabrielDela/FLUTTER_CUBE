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

  //pour la barre de recherche
  String search = "";
  @override
  void initState() {
    AuthController.getAmis().then((value) {
      for (var ami in value) {
        listeDesAmis.add(ami);
        print(ami.lastName);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return FutureBuilder<List<Utilisateur>>(
      future: Ami(), // function where you call your api
      builder:
          (BuildContext context, AsyncSnapshot<List<Utilisateur>> snapshot) {
        // AsyncSnapshot<Your object type>
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Chargement'));
        } else {
          if (snapshot.hasError)
            return Center(child: Text('Error: ${snapshot.error}'));
          else
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
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
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8.0),
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: ListTile(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, "/profil_ami");
                                            },
                                            leading: ClipOval(
                                              child: Image.asset(
                                                'assets/images/avatarfemale.jpg',
                                              ),
                                            ),
                                            title: Text(ami.lastName +
                                                " " +
                                                ami.firtsName),
                                            subtitle: Text(ami.typeRelation),
                                            trailing: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary:
                                                    CustomColors.MAIN_PURPLE,
                                              ),
                                              child: Icon(
                                                Icons.delete,
                                                size: 20,
                                                color: Colors.white,
                                              ),
                                              onPressed: () async {
                                                print(
                                                    "*************************************oui");
                                                print(ami.relationId);
                                                await AuthController.deleteAmi(
                                                    ami.relationId);
                                                Navigator.pop(
                                                    context); // pop current page
                                                Navigator.pushNamed(
                                                    context, "/amis");
                                              },
                                            ),
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
            ); // snapshot.data  :- get your object which is pass from your downloadData() function
        }
      },
    );
  }
}
