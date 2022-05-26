import 'package:cube/classes/couleurs/classe_colors.dart';
import 'package:cube/classes/modeles/modele_Ressource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageMonProfil extends StatefulWidget {
  const PageMonProfil({Key? key}) : super(key: key);

  @override
  _PageMonProfilState createState() => _PageMonProfilState();
}

class _PageMonProfilState extends State<PageMonProfil> {
  List<Ressource> listeRessource = [
    Ressource(
        nomUtilisateur: "Roberts",
        prenomUtilisateur: "Nathan",
        descriptionArticle: "lorem ipsum",
        dateTempo: "10/10/2022",
        nbComment: 10,
        nbShare: 5,
        nbLike: 4,
        lienVersImage:
            "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg"),
    Ressource(
        nomUtilisateur: "Roberts",
        prenomUtilisateur: "Nathan",
        descriptionArticle: "lorem ipsum",
        dateTempo: "11/11/2022",
        nbComment: 100,
        nbShare: 50,
        nbLike: 40,
        lienVersImage:
            "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg")
  ];
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
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
                  child: Image.network(
                    'https://franchisematch.com/wp-content/uploads/2015/02/john-doe.jpg',
                  ),
                ),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
              height: 200,
              color: CustomColors.MAIN_PURPLE,
              child: Row(
                children: [
                  Column(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(top: 25),
                          child: CircleAvatar(
                            radius: 55,
                            backgroundColor: Colors.transparent,
                            child: ClipOval(
                              child: Image.network(
                                'https://franchisematch.com/wp-content/uploads/2015/02/john-doe.jpg',
                              ),
                            ),
                          )),
                    ],
                  ),
                  Column(
                    children: [
                      Row(children: [
                        Text(
                          "JHON DOE",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 25),
                        ),
                        IconButton(
                          onPressed: null,
                          icon: Icon(Icons.edit, color: Colors.white),
                          iconSize: 25,
                        )
                      ]),
                      Row(children: [
                        SizedBox(
                          width: queryData.size.width * 0.7,
                          child: Text(
                            "Contrary to popular belief, Lorem Ipsum is not simply random text in Virginia, looked up one of the more obscure Latin words",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        )
                      ]),
                      Row(children: [
                        Text(
                          "200 relations",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white),
                        )
                      ])
                    ],
                  )
                ],
              )),
          Container(
            height: 800,
            color: Colors.white,
            child: Container(
                child: Row(children: [
              Column(children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.transparent,
                      child: ClipOval(
                        child: Image.network(
                          'https://franchisematch.com/wp-content/uploads/2015/02/john-doe.jpg',
                        ),
                      ),
                    )),
              ]),
              Column(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Jhon Doe",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "23/02/2022",
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("lorem ipsum blablablablablabla",
                              textAlign: TextAlign.center)
                        ],
                      )
                    ],
                  ),
                  Column()
                ],
              ),
              Column() //colonne vide
            ])),
          ),
        ]),
      ),
    );
  }
}
