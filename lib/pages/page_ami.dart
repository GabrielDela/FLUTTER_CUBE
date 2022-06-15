import 'dart:ffi';

import 'package:cube/classes/couleurs/classe_colors.dart';
import 'package:cube/controller/authController.dart';
import 'package:cube/pages/page_profilami.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../classes/modeles/modele_Relation.dart';

class PageAmi extends StatefulWidget {
  const PageAmi({Key? key}) : super(key: key);

  @override
  _PageAmiState createState() => _PageAmiState();
}

class _PageAmiState extends State<PageAmi> {
  AuthController authController = new AuthController();
  String id = "";

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = prefs.getString('userId');
    if (stringValue != null) {
      setState(() {
        id = stringValue;
      });
    }
  }

  //pour la barre de recherche
  String search = "";
  @override
  void initState() {
    super.initState();
    getStringValuesSF();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return FutureBuilder<List<Relations>>(
      future: AuthController.getAmis(id),
      builder: (BuildContext context, snapshot) {
        // AsyncSnapshot<Your object type>
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Chargement'));
        } else {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
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
              body: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: ListTile(
                        onTap: () {
                          if (kDebugMode) {
                            print("TAAAAAARTE");
                            print(snapshot.data![index].user.email);
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PageProfilAmi(
                                  user: snapshot.data![index].user),
                            ),
                          );
                        },
                        leading: ClipOval(
                          child: Image.asset(
                            'assets/images/avatarfemale.jpg',
                          ),
                        ),
                        title: Text(snapshot.data![index].user.lastname +
                            " " +
                            snapshot.data![index].user.firstname),
                        subtitle: Text(snapshot.data![index].relation),
                        trailing: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: CustomColors.MAIN_PURPLE,
                          ),
                          child: Icon(
                            Icons.delete,
                            size: 20,
                            color: Colors.white,
                          ),
                          onPressed: () async {
                            print("*************************************oui");
                            //print(ami.relationId);
                            await AuthController.deleteAmi(
                                snapshot.data![index].id);
                            Navigator.pop(context); // pop current page
                            Navigator.pushNamed(context, "/amis");
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        }
      },
    );
  }
}
