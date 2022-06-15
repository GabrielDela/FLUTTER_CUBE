import 'package:cube/classes/couleurs/classe_colors.dart';
import 'package:cube/classes/modeles/modele_Relation.dart';
import 'package:cube/classes/modeles/modele_Ressource.dart';
import 'package:cube/controller/authController.dart';
import 'package:flutter/material.dart';

class PageProfilAmi extends StatefulWidget {
  final User user;

  const PageProfilAmi({Key? key, required this.user}) : super(key: key);

  @override
  _PageProfilAmiState createState() => _PageProfilAmiState();
}

class _PageProfilAmiState extends State<PageProfilAmi> {
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
                              child: Image.asset(
                                'assets/images/avatarmale.jpg',
                              ),
                            ),
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
                              Icons.group_add,
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
                            )
                        //   child: Padding(
                        //     padding: EdgeInsets.symmetric(vertical: 8.0),
                        //     child: Card(
                        //         shape: RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(25),
                        //         ),
                        //         child: Container(
                        //           margin: EdgeInsets.only(
                        //               left: 0.5, right: 0.5, top: 0.5, bottom: 5),
                        //           height: 370,
                        //           width: double.infinity,
                        //           decoration: BoxDecoration(
                        //               color: Colors.white,
                        //               boxShadow: [
                        //                 BoxShadow(
                        //                     color: Colors.grey.shade50,
                        //                     spreadRadius: 4,
                        //                     blurRadius: 6,
                        //                     offset: Offset(0, 3)),
                        //               ]),
                        //           child: Column(
                        //             children: [
                        //               Container(
                        //                 //color: Colors.purple,
                        //                 height: 120,
                        //                 decoration: BoxDecoration(
                        //                   image: DecorationImage(
                        //                       image: AssetImage(
                        //                           // snapshot.data![index].image
                        //                           "assets/images/img1.jpg"),
                        //                       fit: BoxFit.cover),
                        //                 ),
                        //                 child: Stack(
                        //                   children: [
                        //                     Positioned(
                        //                       top: 5,
                        //                       right: -15,
                        //                       child: MaterialButton(
                        //                         color: Colors.white,
                        //                         shape: CircleBorder(),
                        //                         onPressed: () {},
                        //                         child: Icon(Icons.favorite_border,
                        //                             color: CustomColors.MAIN_PURPLE,
                        //                             size: 25),
                        //                       ),
                        //                     )
                        //                   ],
                        //                 ),
                        //               ),
                        //               Container(
                        //                 child: Row(
                        //                   mainAxisAlignment:
                        //                       MainAxisAlignment.spaceBetween,
                        //                   children: [
                        //                     Padding(
                        //                       padding: EdgeInsets.symmetric(
                        //                           vertical: 10.0, horizontal: 10.0),
                        //                       child: CircleAvatar(
                        //                         radius: 25,
                        //                         backgroundColor: Colors.transparent,
                        //                         child: ClipOval(
                        //                           child: Image.asset(
                        //                             'assets/images/avatarfemale.jpg',
                        //                           ),
                        //                         ),
                        //                       ),
                        //                     ),
                        //                     Text(
                        //                       snapshot.data![index].title,
                        //                       style: TextStyle(
                        //                           fontWeight: FontWeight.bold,
                        //                           fontSize: 20),
                        //                     ),
                        //                     Text(
                        //                       "${snapshot.data![index].createdAt.day}-${snapshot.data![index].createdAt.month}-${snapshot.data![index].createdAt.year}",
                        //                       style: TextStyle(fontSize: 12),
                        //                     ),
                        //                   ],
                        //                 ),
                        //               ),
                        //               SizedBox(
                        //                 height: 5,
                        //               ),
                        //               Row(
                        //                 mainAxisAlignment: MainAxisAlignment.center,
                        //                 children: [
                        //                   SizedBox(
                        //                     width:
                        //                         queryData.size.width * 0.9, //300,
                        //                     height: 100,
                        //                     child: Text(
                        //                       snapshot.data![index].description,
                        //                       textDirection: TextDirection.ltr,
                        //                       textAlign: TextAlign.justify,
                        //                       style: new TextStyle(
                        //                         fontSize: 14,
                        //                         color: Colors.grey,
                        //                       ),
                        //                       maxLines: 10,
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //               Container(
                        //                   child: Row(
                        //                 mainAxisAlignment:
                        //                     MainAxisAlignment.spaceEvenly,
                        //                 children: [
                        //                   // Row(
                        //                   //   children: [
                        //                   //     Text(snapshot.data![index].likes
                        //                   //         .toString()),
                        //                   //     IconButton(
                        //                   //         onPressed: () {},
                        //                   //         icon:
                        //                   //             Icon(Icons.message_outlined),
                        //                   //         color: CustomColors.MAIN_PURPLE),
                        //                   //   ],
                        //                   // ),
                        //                   Row(
                        //                     children: [
                        //                       Text(snapshot.data![index].share
                        //                           .toString()),
                        //                       IconButton(
                        //                           onPressed: () {},
                        //                           icon: Icon(Icons.share_outlined),
                        //                           color: CustomColors.MAIN_PURPLE),
                        //                     ],
                        //                   ),
                        //                   Row(
                        //                     children: [
                        //                       Text(snapshot.data![index].likes
                        //                           .toString()),
                        //                       IconButton(
                        //                           onPressed: () {
                        //                             print("tessst");
                        //                             print(snapshot.data![index]);
                        //                           },
                        //                           icon: Icon(
                        //                               Icons.thumb_up_alt_outlined),
                        //                           color: CustomColors.MAIN_PURPLE),
                        //                     ],
                        //                   )
                        //                 ],
                        //               ))
                        //             ],
                        //           ),
                        //         )),
                        //   ),
                        // ),
                        );
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
              // Column(
              //     children: ListressourcePartagees.map((ressource) {
              //   return Container(
              //     margin:
              //         EdgeInsets.only(left: 0.5, right: 0.5, top: 0.5, bottom: 5),
              //     height: 370,
              //     width: double.infinity,
              //     decoration: BoxDecoration(color: Colors.white, boxShadow: [
              //       BoxShadow(
              //           color: Colors.grey.shade50,
              //           spreadRadius: 4,
              //           blurRadius: 6,
              //           offset: Offset(0, 3)),
              //     ]),
              //     child: Column(
              //       children: [
              //         Container(
              //           //color: Colors.purple,
              //           height: 120,
              //           decoration: BoxDecoration(
              //             image: DecorationImage(
              //                 image: AssetImage(ressource['image']),
              //                 fit: BoxFit.cover),
              //           ),
              //           child: Stack(
              //             children: [
              //               Positioned(
              //                 top: 5,
              //                 right: -15,
              //                 child: MaterialButton(
              //                   color: Colors.white,
              //                   shape: CircleBorder(),
              //                   onPressed: () {},
              //                   child: Icon(Icons.favorite_border_outlined,
              //                       color: CustomColors.MAIN_PURPLE, size: 25),
              //                 ),
              //               )
              //             ],
              //           ),
              //         ),
              //         Container(
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Padding(
              //                 padding: EdgeInsets.symmetric(
              //                     vertical: 10.0, horizontal: 10.0),
              //                 child: CircleAvatar(
              //                   radius: 25,
              //                   backgroundColor: Colors.transparent,
              //                   child: ClipOval(
              //                     child: Image.asset(
              //                       'assets/images/avatarfemale.jpg',
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               Text(
              //                 ressource["nom"],
              //                 style: TextStyle(
              //                     fontWeight: FontWeight.bold, fontSize: 20),
              //               ),
              //               Text(ressource["date"],
              //                   style: TextStyle(fontSize: 12)),
              //             ],
              //           ),
              //         ),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Text(
              //               ressource["category"],
              //               style: TextStyle(
              //                   fontWeight: FontWeight.bold, fontSize: 15),
              //             ),
              //           ],
              //         ),
              //         SizedBox(
              //           height: 5,
              //         ),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             SizedBox(
              //               width: queryData.size.width * 0.9, //300,
              //               height: 100,
              //               child: Text(
              //                 ressource["description"],
              //                 textDirection: TextDirection.ltr,
              //                 textAlign: TextAlign.justify,
              //                 style: new TextStyle(
              //                   fontSize: 14,
              //                   color: Colors.grey,
              //                 ),
              //                 maxLines: 10,
              //               ),
              //             ),
              //           ],
              //         ),
              //         Container(
              //             child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             Row(
              //               children: [
              //                 Text(ressource["comment"].toString()),
              //                 IconButton(
              //                     onPressed: () {},
              //                     icon: Icon(Icons.message_outlined),
              //                     color: CustomColors.MAIN_PURPLE),
              //               ],
              //             ),
              //             Row(
              //               children: [
              //                 Text(ressource["share"].toString()),
              //                 IconButton(
              //                     onPressed: () {},
              //                     icon: Icon(Icons.share_outlined),
              //                     color: CustomColors.MAIN_PURPLE),
              //               ],
              //             ),
              //             Row(
              //               children: [
              //                 Text(ressource["like"].toString()),
              //                 IconButton(
              //                     onPressed: () {},
              //                     icon: Icon(Icons.thumb_up_alt_outlined),
              //                     color: CustomColors.MAIN_PURPLE),
              //               ],
              //             )
              //           ],
              //         ))
              //       ],
              //     ),
              //   );
              // }).toList()),
            ],
          ),
        ),
      ),
    );
  }
}
