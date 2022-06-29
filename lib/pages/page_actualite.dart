import 'package:cube/classes/couleurs/classe_colors.dart';
import 'package:cube/classes/modeles/modele_Commentaire.dart';
import 'package:cube/classes/modeles/modele_Ressource.dart';
import 'package:cube/controller/authController.dart';
import 'package:cube/pages/page_commentaire.dart';
import 'package:cube/pages/page_detailressource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageActu extends StatefulWidget {
  const PageActu({Key? key}) : super(key: key);

  @override
  _PageActuState createState() => _PageActuState();
}

class _PageActuState extends State<PageActu> {
  IconData _icon = Icons.favorite_outline;
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
        title: const Text("Fil d'actualités"),
        centerTitle: true,
        backgroundColor: CustomColors.MAIN_PURPLE,
      ),
      body: Container(
        child: FutureBuilder<List<Ressource>>(
          future: AuthController.getRessources(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Ressource>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: Text('Chargement'));
            } else {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }
              return ListView.builder(
                scrollDirection: Axis.vertical,
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
                                    builder: (context) => PageDetailRessource(
                                      ressource: snapshot.data![index],
                                    ),
                                  ),
                                );
                              },
                              title: Text(snapshot.data![index].title),
                              subtitle: Text(snapshot.data![index].description),
                              trailing: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _icon = Icons.favorite;
                                  });
                                  AuthController.postFavoris(
                                      id, snapshot.data![index].id);
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
                                data: snapshot.data![index].content!.length >=
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
                                        builder: (context) => PageCommentaire(
                                          idRessource: snapshot.data![index].id,
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
                                      return Center(child: Text('Chargement'));
                                    } else {
                                      if (osnapshot.hasError) {
                                        return Center(
                                          child:
                                              Text('Error: ${osnapshot.error}'),
                                        );
                                      }
                                      return Text(osnapshot.data.toString());
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
      ),
      //body
    );
  }
}
