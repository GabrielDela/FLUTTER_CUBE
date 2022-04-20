import 'package:cube/class/classe_colors.dart';
import 'package:flutter/material.dart';

class PageActu extends StatefulWidget {
  const PageActu({Key? key}) : super(key: key);

  @override
  _PageActuState createState() => _PageActuState();
}

class _PageActuState extends State<PageActu> {
  final List listeRessource = [
    {
      'nom': "Nathan Roberts",
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
      'nom': "Bessie Cooper",
      'category': "Cuisine",
      'date': '08/08/2022',
      'description':
          "Mauris tortor nisi, interdum sit amet elementum nec, mattis vel nibh. Proin eu libero sapien. Duis tristique tempor velit egestas tempus. Etiam vitae ullamcorper mauris. Nunc egestas sollicitudin ante vel rhoncus.",
      'image': "assets/images/img2.jpg",
      'comment': 20,
      'share': 3,
      'like': 10
    },
    {
      'nom': "Eleanor Pena",
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fil d'actualité"),
        centerTitle: true,
        backgroundColor: CustomColors.MAIN_COLOR,
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
      body: (SingleChildScrollView(
        child: Column(
            children: listeRessource.map((ressource) {
          return Container(
            margin: EdgeInsets.all(7),
            height: 370,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 4,
                      blurRadius: 6,
                      offset: Offset(0, 3)),
                ]),
            child: Column(
              children: [
                Container(
                  //color: Colors.purple,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    image: DecorationImage(
                        image: AssetImage(ressource['image']),
                        fit: BoxFit.cover),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 5,
                        right: -15,
                        child: MaterialButton(
                          color: Colors.white,
                          shape: CircleBorder(),
                          onPressed: () {},
                          child: Icon(Icons.favorite_border,
                              color: Colors.deepPurpleAccent, size: 25),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.transparent,
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/avatarfemale.jpg',
                            ),
                          ),
                        ),
                      ),
                      Text(
                        ressource["nom"],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(ressource["date"], style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ressource["category"],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 300,
                      height: 100,
                      child: Text(
                        ressource["description"],
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.justify,
                        style: new TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        maxLines: 10,
                      ),
                    ),
                  ],
                ),
                Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Text(ressource["comment"].toString()),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.message_outlined),
                            color: CustomColors.MAIN_COLOR),
                      ],
                    ),
                    Row(
                      children: [
                        Text(ressource["share"].toString()),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.share_outlined),
                            color: CustomColors.MAIN_COLOR),
                      ],
                    ),
                    Row(
                      children: [
                        Text(ressource["like"].toString()),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.thumb_up_alt_outlined),
                            color: CustomColors.MAIN_COLOR),
                      ],
                    )
                  ],
                ))
              ],
            ),
          );
        }).toList()),
      )), //body
    );
  }
}
