import 'package:cube/classes/couleurs/classe_colors.dart';
import 'package:cube/classes/modeles/modele_Ressource.dart';
import 'package:cube/classes/modeles/modele_Utilisateur.dart';
import 'package:cube/controller/authController.dart';
import 'package:cube/pages/page_commentaire.dart';
import 'package:cube/pages/page_detailressource.dart';
import 'package:cube/pages/page_modifierbio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageProfil extends StatefulWidget {
  const PageProfil({Key? key}) : super(key: key);

  @override
  _PageProfilState createState() => _PageProfilState();
}

class _PageProfilState extends State<PageProfil> {
  IconData _icon = Icons.delete;
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

  @override
  void initState() {
    super.initState();
    getStringValuesSF();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      //évite lors de l'utilisation du clavier pour les champs texte les problèmes de bottom over flow sur les pages
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Mon profil"),
        centerTitle: true,
        backgroundColor: CustomColors.MAIN_PURPLE,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              margin: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.white, //CustomColors.MAIN_PURPLE,
                //   borderRadius: BorderRadius.circular(0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 2,
                      offset: Offset(0, 2)),
                ],
              ),
              child: Column(
                children: [
                  FutureBuilder<Users>(
                    future: AuthController.getUserById(id),
                    builder:
                        (BuildContext context, AsyncSnapshot<Users> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: Text('Chargement'));
                      } else {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        }
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                                  child: CircleAvatar(
                                    radius: 35,
                                    backgroundColor: Colors.transparent,
                                    child: ClipOval(
                                        child: (snapshot.data!.avatar != null
                                            ? Image.network(snapshot
                                                .data!.avatar
                                                .toString())
                                            : Image.asset(
                                                "assets/images/avatarfemale.jpg"))),
                                  ),
                                ),
                                Text(
                                  "${snapshot.data!.firstname} ${snapshot.data!.lastname} (${snapshot.data!.tag})",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.black),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PageModifierBio(),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: CustomColors.MAIN_PURPLE,
                                    size: 20,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 40,
                                ),
                                SizedBox(
                                  width: 300,
                                  height: 100,
                                  child: Text(
                                    "${snapshot.data!.biography}",
                                    textDirection: TextDirection.ltr,
                                    textAlign: TextAlign.justify,
                                    style: new TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                    ),
                                    maxLines: 10,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      }
                    },
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 250,
                      ),
                      FutureBuilder<int>(
                        future: AuthController.getNumberAmis(id),
                        builder: (BuildContext context,
                            AsyncSnapshot<int> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: Text('Chargement'));
                          } else {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text('Error: ${snapshot.error}'),
                              );
                            }
                            return Text(
                              "${snapshot.data!} relation(s)",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            );
                          }
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    "Mes ressources",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                        color: CustomColors.MAIN_PURPLE),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            FutureBuilder<List<Ressource>>(
              future: AuthController.getRessourcesUser(id),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Ressource>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: Text('Chargement'));
                } else {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) {
                      return Container(
                        child: Card(
                          elevation: 4.0,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                ListTile(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PageDetailRessource(
                                          ressource: snapshot.data![index],
                                        ),
                                      ),
                                    );
                                  },
                                  title: Text(snapshot.data![index].title),
                                  subtitle:
                                      Text(snapshot.data![index].description),
                                  trailing: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        _icon = Icons.delete;
                                      });
                                      AuthController.deleteRessource(
                                          snapshot.data![index].id);
                                    },
                                    child: Icon(
                                      _icon,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: CustomColors.MAIN_PURPLE,
                                      surfaceTintColor: Colors.white,
                                      elevation: 5.0,
                                      shape: const CircleBorder(),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 200.0,
                                  child: Html(
                                    data: snapshot
                                                .data![index].content!.length >=
                                            403
                                        ? ("${snapshot.data![index].content?.substring(0, 403)}...")
                                        : (snapshot.data![index].content),
                                  ),
                                ),
                                ButtonBar(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.comment),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                PageCommentaire(
                                              idRessource:
                                                  snapshot.data![index].id,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    FutureBuilder<int>(
                                      future: AuthController.getNumberComments(
                                          snapshot.data![index].id),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<int> osnapshot) {
                                        if (osnapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Center(
                                              child: Text('Chargement'));
                                        } else {
                                          if (osnapshot.hasError) {
                                            return Center(
                                              child: Text(
                                                  'Error: ${osnapshot.error}'),
                                            );
                                          }
                                          return Text(
                                              osnapshot.data.toString());
                                        }
                                      },
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
