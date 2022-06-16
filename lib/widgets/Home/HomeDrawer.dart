import 'package:cube/classes/couleurs/classe_colors.dart';
import 'package:cube/classes/modeles/modele_Utilisateur.dart';
import 'package:cube/controller/authController.dart';
import 'package:cube/pages/page_actualite.dart';
import 'package:cube/pages/page_ami.dart';
import 'package:cube/pages/page_favoris.dart';
import 'package:cube/pages/page_parametre.dart';
import 'package:cube/pages/page_profil.dart';
import 'package:cube/pages/page_ressource.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  String id = "";
  IconData _icon = Icons.favorite_outline;

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = prefs.getString('userId');
    if (stringValue != null) {
      setState(() {
        id = stringValue;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getStringValuesSF();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColors.MAIN_PURPLE,
      child: FutureBuilder<Users>(
          future: AuthController.getUserById(id),
          builder: (BuildContext context, AsyncSnapshot<Users> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              print("le test");
              print(snapshot.data);
              return Center(child: Text('Chargement'));
            } else {
              if (snapshot.hasError) {
                print("testttt");
                print(snapshot.data);
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }
              return ListView(
                padding: EdgeInsets.zero,
                children: [
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: CustomColors.MAIN_PURPLE,
                    ),
                    accountName: Text(
                        "${snapshot.data!.firstname} ${snapshot.data!.lastname}"),
                    accountEmail: Text("${snapshot.data!.tag}"),
                    currentAccountPicture: CircleAvatar(
                      maxRadius: 50,
                      minRadius: 30,
                      backgroundColor: Colors.transparent,
                      child: ClipOval(
                        child: (snapshot.data!.avatar != null
                            ? Image.network(snapshot.data!.avatar.toString())
                            : Image.asset("assets/images/avatarfemale.jpg")),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.favorite_outline_sharp,
                      color: CustomColors.DRAWER_TEXT_COLOR,
                    ),
                    title: const Text(
                      'Favoris',
                      style: TextStyle(
                        color: CustomColors.DRAWER_TEXT_COLOR,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PageFavoris(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.people_outline,
                      color: CustomColors.DRAWER_TEXT_COLOR,
                    ),
                    title: const Text(
                      'Amis',
                      style: TextStyle(
                        color: CustomColors.DRAWER_TEXT_COLOR,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PageAmi(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.add_comment_outlined,
                      color: CustomColors.DRAWER_TEXT_COLOR,
                    ),
                    title: const Text(
                      'Créer une ressource',
                      style: TextStyle(
                        color: CustomColors.DRAWER_TEXT_COLOR,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PageRessources(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.account_circle_outlined,
                      color: CustomColors.DRAWER_TEXT_COLOR,
                    ),
                    title: const Text(
                      'Mon profil',
                      style: TextStyle(
                        color: CustomColors.DRAWER_TEXT_COLOR,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PageProfil(
                            user: snapshot.data!,
                          ),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.newspaper_outlined,
                      color: CustomColors.DRAWER_TEXT_COLOR,
                    ),
                    title: const Text(
                      "Fil d'actualité",
                      style: TextStyle(
                        color: CustomColors.DRAWER_TEXT_COLOR,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PageActu(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.settings,
                      color: CustomColors.DRAWER_TEXT_COLOR,
                    ),
                    title: const Text(
                      "Paramètres",
                      style: TextStyle(
                        color: CustomColors.DRAWER_TEXT_COLOR,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PageParametre(),
                        ),
                      );
                    },
                  )
                ],
              );
            }
          }),
    );
  }
}
