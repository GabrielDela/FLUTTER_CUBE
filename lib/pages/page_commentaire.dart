import 'package:cube/classes/couleurs/classe_colors.dart';
import 'package:cube/classes/modeles/modele_Commentaire.dart';
import 'package:cube/classes/modeles/modele_Utilisateur.dart';
import 'package:cube/controller/authController.dart';
import 'package:flutter/material.dart';

class PageCommentaire extends StatefulWidget {
  final idRessource;

  const PageCommentaire({Key? key, required this.idRessource})
      : super(key: key);

  @override
  _PageCommentaireState createState() => _PageCommentaireState();
}

class _PageCommentaireState extends State<PageCommentaire> {
  final List listCommentaire = [
    {
      'tag': '@RobertNath044',
      'image': 'assets/images/avatarmale.jpg',
      'text':
          'Mauris sit amet erat vitae odio accumsan viverra ac ut libero. Ut luctus odio blandit mollis finibus.'
    },
    {
      'tag': '@StanSmith027',
      'image': 'assets/images/avatarmale2.jpg',
      'text':
          'Sed eu varius diam. Proin arcu leo, rutrum et odio sit amet, cursus laoreet urna.'
    },
    {
      'tag': '@BessCoop999',
      'image': 'assets/images/avatarfemale.jpg',
      'text':
          'Duis ullamcorper nunc et ex pulvinar, nec egestas ante aliquam. Donec eros ipsum, mollis sit amet laoreet quis, fermentum at massa.'
    },
  ];
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      //évite lors de l'utilisation du clavier pour les champs texte les problèmes de bottom over flow sur les pages
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Commentaire de la ressource"),
        centerTitle: true,
        backgroundColor: CustomColors.MAIN_PURPLE,
      ),
      //backgroundColor: Colors.grey.shade200,
      body: Container(
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
                            FutureBuilder<Users>(
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
                                    title: Text(osnapshot.data!.tag),
                                    subtitle:
                                        Text(snapshot.data![index].comment),
                                  );
                                }
                              },
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
    );
  }
}
