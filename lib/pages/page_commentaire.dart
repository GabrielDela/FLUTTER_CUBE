import 'package:cube/classes/couleurs/classe_colors.dart';
import 'package:flutter/material.dart';

class PageCommentaire extends StatefulWidget {
  const PageCommentaire({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 50,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      "La cuisine par Bessie Cooper @BessCoop999",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: CustomColors.MAIN_PURPLE),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var commentaire in listCommentaire)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 3.0),
                      child: Container(
                        height: 220,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.white,
                                blurRadius: 2,
                                offset: Offset(0, 1)),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.transparent,
                                    child: ClipOval(
                                      child: Image.asset(
                                        commentaire['image'],
                                      ),
                                    ),
                                  ),
                                  Text(
                                    commentaire['tag'],
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ]),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: queryData.size.width * 0.95,
                                  height: 150,
                                  child: Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ornare est diam, et commodo ipsum egestas et. Suspendisse id nunc lectus. Donec elementum ipsum quis libero scelerisque, eu consequat enim viverra. Curabitur euismod fringilla purus cursus ultricies. Maecenas porta lacinia nisl et efficitur. Etiam hendrerit nec risus at laoreet. Fusce vitae sagittis diam, et consequat nulla.",
                                    textDirection: TextDirection.ltr,
                                    textAlign: TextAlign.justify,
                                    style: new TextStyle(
                                      fontSize: 12,
                                    ),
                                    maxLines: 10,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
