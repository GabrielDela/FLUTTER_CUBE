import 'package:cube/classes/couleurs/classe_colors.dart';
import 'package:cube/classes/modeles/modele_Ressource.dart';
import 'package:cube/controller/authController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageActu extends StatefulWidget {
  const PageActu({Key? key}) : super(key: key);

  @override
  _PageActuState createState() => _PageActuState();
}

class _PageActuState extends State<PageActu> {
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
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      //évite lors de l'utilisation du clavier pour les champs texte les problèmes de bottom over flow sur les pages
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Fil d'actualités"),
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
                  'assets/images/avatarmale.jpg',
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
          child: FutureBuilder<List<Ressource>>(
        future: AuthController.getRessources(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Ressource>> snapshot) {
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
                            title: Text(snapshot.data![index].title),
                            subtitle: Text(snapshot.data![index].description),
                            trailing: ElevatedButton(
                              onPressed: () {
                                setState() {
                                  _icon = Icons.favorite;
                                }

                                print("ETOILE ${id}");
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
                              data: snapshot.data![index].content,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(16.0),
                            alignment: Alignment.centerLeft,
                            child: Text(snapshot.data![index].status),
                          ),
                          ButtonBar(
                            children: [
                              IconButton(
                                onPressed: () {/* ... */},
                                icon: Icon(Icons.share),
                              ),
                              Text(snapshot.data![index].share.toString()),
                              IconButton(
                                icon: Icon(Icons.comment),
                                onPressed: () {/* ... */},
                              ),
                              Text(
                                  /*snapshot.data![index].likes
                                                .toString()*/
                                  "0"),
                              IconButton(
                                icon: Icon(Icons.thumb_up),
                                onPressed: () {/* ... */},
                              ),
                              Text(snapshot.data![index].likes.toString())
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
      )),

      //body
    );
  }
}
