import 'package:cube/classes/couleurs/classe_colors.dart';
import 'package:cube/classes/modeles/modele_Ressource.dart';
import 'package:cube/controller/authController.dart';
import 'package:flutter/material.dart';

class PageActu extends StatefulWidget {
  const PageActu({Key? key}) : super(key: key);

  @override
  _PageActuState createState() => _PageActuState();
}

class _PageActuState extends State<PageActu> {
  @override
  void initState() {}

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
                  return Card(
                    child: Center(
                      child: Text("tesst"),
                    ),
                  );
                });
          }
        },
      )),

      //body
    );
  }
}
