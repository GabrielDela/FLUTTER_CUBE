import 'package:cube/classes/couleurs/classe_colors.dart';
import 'package:cube/classes/modeles/modele_Ressource.dart';
import 'package:cube/classes/modeles/modele_Utilisateur.dart';
import 'package:cube/controller/authController.dart';
import 'package:flutter/material.dart';

class PageProfil extends StatefulWidget {
  final Users user;

  const PageProfil({Key? key, required this.user}) : super(key: key);

  @override
  _PageProfilState createState() => _PageProfilState();
}

class _PageProfilState extends State<PageProfil> {
  final List listeRessource = [
    {
      'nom': "Nathan Roberts",
      'category': "Langue",
      'date': '09/09/2022',
      'description':
          "Suspendisse lacinia, enim non tincidunt faucibus, turpis nulla laoreet erat, vitae commodo metus turpis a felis. .",
      'image': "assets/images/img3.png",
      'comment': 22,
      'share': 4,
      'like': 12
    },
    {
      'nom': "NathRobets44",
      'category': "Langue",
      'date': '09/09/2022',
      'description':
          "Suspendisse lacinia, enim non tincidunt faucibus, turpis nulla laoreet erat, vitae commodo metus turpis a felis. .",
      'image': "assets/images/img3.png",
      'comment': 22,
      'share': 4,
      'like': 12
    },
    {
      'nom': "@NathRobets44",
      'category': "Langue",
      'date': '09/09/2022',
      'description':
          "Suspendisse lacinia, enim non tincidunt faucibus, turpis nulla laoreet erat, vitae commodo metus turpis a felis. .",
      'image': "assets/images/img3.png",
      'comment': 22,
      'share': 4,
      'like': 12
    },
  ];

  final List ListressourcePartagees = [
    {
      'nom': "@BessieCoop27",
      'category': "Sport",
      'date': '10/10/2022',
      'description':
          "Proin id dictum turpis, nec volutpat erat. Donec id ultrices quam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;",
      'image': "assets/images/img1.jpg",
      'comment': 12,
      'share': 4,
      'like': 7
    },
    {
      'nom': "@BessieCoop27",
      'category': "Sport",
      'date': '10/10/2022',
      'description':
          "Proin id dictum turpis, nec volutpat erat. Donec id ultrices quam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;",
      'image': "assets/images/img1.jpg",
      'comment': 12,
      'share': 4,
      'like': 7
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
        title: const Text("Mon profil"),
        centerTitle: true,
        backgroundColor: CustomColors.MAIN_PURPLE,
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          height: 1000,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                          child: CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.transparent,
                            child: ClipOval(
                                child: (widget.user.avatar != null
                                    ? Image.network(
                                        widget.user.avatar.toString())
                                    : Image.asset(
                                        "assets/images/avatarfemale.jpg"))),
                          ),
                        ),
                        Text(
                          "${widget.user.firstname} ${widget.user.lastname} (${widget.user.tag})",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit,
                              color: CustomColors.MAIN_PURPLE,
                              size: 20,
                            ))
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
                            "${widget.user.biography}",
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
                    Row(
                      children: [
                        SizedBox(
                          width: 290,
                        ),
                        FutureBuilder<int>(
                          future: AuthController.getNumberAmis(widget.user.id),
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
                future: AuthController.getRessourcesUser(widget.user.id),
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
                        itemBuilder: (_, index) => SingleChildScrollView(
                              child: Container(
                                child: Card(
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: ListTile(
                                      title: Text(
                                        snapshot.data![index].title,
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      leading: CircleAvatar(
                                        child: Text(
                                          snapshot.data![index].description,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      trailing: Text(snapshot.data![index].id),
                                    ),
                                  ),
                                ),
                              ),
                            ));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
