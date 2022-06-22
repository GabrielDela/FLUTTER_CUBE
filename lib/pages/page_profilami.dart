import 'package:cube/classes/couleurs/classe_colors.dart';
import 'package:cube/classes/modeles/modele_Relation.dart';
import 'package:cube/classes/modeles/modele_Ressource.dart';
import 'package:cube/controller/authController.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageProfilAmi extends StatefulWidget {
  final User user;
  final String? idRelation;

  const PageProfilAmi({Key? key, required this.user, this.idRelation})
      : super(key: key);

  @override
  _PageProfilAmiState createState() => _PageProfilAmiState();
}

class _PageProfilAmiState extends State<PageProfilAmi> {
  IconData _icon = Icons.add;

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
    if (widget.idRelation != null) {
      setState(() {
        _icon = Icons.delete;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      //évite lors de l'utilisation du clavier pour les champs texte les problèmes de bottom over flow sur les pages
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Profil de ${widget.user.firstname}"),
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
                          onPressed: () {
                            if (_icon == Icons.add) {
                              AuthController.addAmi(id, widget.user.id);
                              setState(() {
                                _icon = Icons.delete;
                              });
                            } else {
                              if (_icon == Icons.delete) {
                                AuthController.deleteAmi(
                                    widget.idRelation.toString());
                                setState(() {
                                  _icon = Icons.add;
                                });
                              }
                            }
                          },
                          icon: Icon(
                            _icon,
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
                      "Ses ressources",
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
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      "Ressources partagées",
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
            ],
          ),
        ),
      ),
    );
  }
}
