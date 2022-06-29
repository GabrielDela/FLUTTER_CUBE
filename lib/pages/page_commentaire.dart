import 'package:cube/classes/couleurs/classe_colors.dart';
import 'package:cube/classes/modeles/modele_Commentaire.dart';
import 'package:cube/classes/modeles/modele_Utilisateur.dart';
import 'package:cube/controller/authController.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class PageCommentaire extends StatefulWidget {
  final idRessource;

  const PageCommentaire({Key? key, required this.idRessource})
      : super(key: key);

  @override
  _PageCommentaireState createState() => _PageCommentaireState();
}

class _PageCommentaireState extends State<PageCommentaire> {
  TextEditingController commentaire = new TextEditingController();
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
  void initState() async {
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
          title: const Text("Commentaires de la ressource"),
          centerTitle: true,
          backgroundColor: CustomColors.MAIN_PURPLE,
        ),
        //backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              Container(
                width: queryData.size.width * 0.9,
                padding: EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  controller: commentaire,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          AuthController.postComment(
                              id, widget.idRessource, commentaire.text);
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PageCommentaire(
                                  idRessource: widget.idRessource),
                            ),
                          );
                        },
                      ),
                      border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.black),
                      ),
                      hintText: 'Poster un commentaire',
                      hintStyle: TextStyle(color: Colors.black),
                      contentPadding: EdgeInsets.all(10),
                      enabled: true),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                child: FutureBuilder<List<Commentaire>>(
                  future: AuthController.getCommentaires(widget.idRessource),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Commentaire>> snapshot) {
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
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) {
                          return Card(
                            elevation: 4.0,
                            child: FutureBuilder<Users>(
                              future: AuthController.getUserById(
                                  snapshot.data![index].idUser),
                              builder: (BuildContext context,
                                  AsyncSnapshot<Users> osnapshot) {
                                if (osnapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: Text("Chargement"),
                                  );
                                } else {
                                  if (osnapshot.hasError) {
                                    return Center(
                                      child: Text("Error: ${osnapshot.error}"),
                                    );
                                  }
                                  return ListTile(
                                    isThreeLine: true,
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      child: ClipOval(
                                        child: (osnapshot.data!.avatar != null
                                            ? Image.network(osnapshot
                                                .data!.avatar
                                                .toString())
                                            : Image.asset(
                                                "assets/images/avatarfemale.jpg")),
                                      ),
                                    ),
                                    title: Text(
                                        "${osnapshot.data!.lastname} ${osnapshot.data!.firstname} (${osnapshot.data!.tag})"),
                                    subtitle: Text(
                                        "\n${snapshot.data![index].comment}\n\n${DateFormat("dd/MM/yyyy", 'fr').format(snapshot.data![index].createDate)}"),
                                  );
                                }
                              },
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }
}
