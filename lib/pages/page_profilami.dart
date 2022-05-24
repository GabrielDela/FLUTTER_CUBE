import 'package:cube/classes/couleurs/classe_colors.dart';
import 'package:flutter/material.dart';

class PageProfil2 extends StatefulWidget {
  const PageProfil2({Key? key}) : super(key: key);

  @override
  _PageProfil2State createState() => _PageProfil2State();
}

class _PageProfil2State extends State<PageProfil2> {
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
      'nom': "Nathan Roberts",
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
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil Ami"),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Container(
              height: 250,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: CustomColors.MAIN_PURPLE,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 4,
                      offset: Offset(0, 4)),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                        child: CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.transparent,
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/avatarmale.jpg',
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Nathan Roberts",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                      Text(
                        "@RobertNat44",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          fontSize: 12,
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.group_add,
                            color: Colors.white,
                            size: 20,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 5,
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
                          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters",
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.justify,
                          style: new TextStyle(
                            fontSize: 13,
                            color: Colors.white,
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
                      Text(
                        "35 relations",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 1200,
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
                                    'assets/images/avatarmale.jpg',
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              ressource["nom"],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(ressource["date"],
                                style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            ressource["category"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
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
                                  color: CustomColors.MAIN_PURPLE),
                            ],
                          ),
                          Row(
                            children: [
                              Text(ressource["share"].toString()),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.share_outlined),
                                  color: CustomColors.MAIN_PURPLE),
                            ],
                          ),
                          Row(
                            children: [
                              Text(ressource["like"].toString()),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.thumb_up_alt_outlined),
                                  color: CustomColors.MAIN_PURPLE),
                            ],
                          )
                        ],
                      ))
                    ],
                  ),
                );
              }).toList()),
            )
          ],
        ),
      ),
    );
  }
}
