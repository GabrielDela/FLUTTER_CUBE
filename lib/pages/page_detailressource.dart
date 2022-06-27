import 'package:cube/classes/couleurs/classe_colors.dart';
import 'package:cube/classes/modeles/modele_Ressource.dart';
import 'package:cube/classes/modeles/modele_Utilisateur.dart';
import 'package:cube/controller/authController.dart';
import 'package:cube/pages/page_profilami.dart';
import 'package:cube/widgets/Home/HomeAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageDetailRessource extends StatefulWidget {
  final Ressource ressource;
  const PageDetailRessource({Key? key, required this.ressource})
      : super(key: key);

  @override
  State<PageDetailRessource> createState() => _PageDetailRessourceState();
}

class _PageDetailRessourceState extends State<PageDetailRessource> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Détail de la ressource"),
        centerTitle: true,
        backgroundColor: CustomColors.MAIN_PURPLE,
      ),
      body: Container(
        child: Card(
          elevation: 4.0,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                FutureBuilder<Users>(
                    future: AuthController.getUserById(widget.ressource.userId),
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
                        return ListTile(
                          trailing: IconButton(
                            onPressed: () {
                              AuthController.addAmi(id, snapshot.data!.id);
                              final snackBar = SnackBar(
                                content: const Text('Ajouté(e) !'),
                                action: SnackBarAction(
                                  label: 'Ok',
                                  onPressed: () {
                                    // Some code to undo the change.
                                  },
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                            icon: Icon(Icons.add),
                          ),
                          leading: CircleAvatar(
                            maxRadius: 50,
                            minRadius: 30,
                            backgroundColor: Colors.transparent,
                            child: ClipOval(
                              child: (snapshot.data!.avatar != null
                                  ? Image.network(
                                      snapshot.data!.avatar.toString())
                                  : Image.asset(
                                      "assets/images/avatarfemale.jpg")),
                            ),
                          ),
                          title: Text(
                              "${snapshot.data!.firstname} ${snapshot.data!.lastname}"),
                          subtitle: Text(snapshot.data!.tag),
                        );
                      }
                    }),
                ListTile(
                  title: Text(widget.ressource.title),
                  subtitle: Text(widget.ressource.description),
                ),
                Container(
                  height: 200.0,
                  child: Html(
                    data: widget.ressource.content,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.centerLeft,
                  child: Text(widget.ressource.status),
                ),
                ButtonBar(
                  children: [
                    IconButton(
                      onPressed: () {/* ... */},
                      icon: Icon(Icons.share),
                    ),
                    Text(widget.ressource.share.toString()),
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
                    Text(widget.ressource.likes.toString())
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
