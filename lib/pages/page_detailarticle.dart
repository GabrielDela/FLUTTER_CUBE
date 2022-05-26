import 'package:cube/classes/couleurs/classe_colors.dart';
import 'package:cube/classes/modeles/modele_RessourceJson.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PageArticle extends StatefulWidget {
  const PageArticle({Key? key}) : super(key: key);

  @override
  _PageArticleState createState() => _PageArticleState();
}

class _PageArticleState extends State<PageArticle> {
  //ressource passée en paramètre pour pouvoir l'afficher : cette fonction est à repenser et ré écrire
  //dans le cas ou on reçoit un fichier json modulaire (gérer avec des if chaqué clé json avec un pour chaque
  // clé du fichier json pour vérifier si elles contiennent texte ou article)
  // pb ça risque d'être gourmand pour afficher une ressource :
  // en effet : pour chaque widget à afficher on va devoir appeler la fonction qui na nous retourner un widget
  // donc re parcourir toute la liste json  + repasser par tout les if : peux de perf.
  Widget getWidget(int number, RessourceJson ressource) {
    switch (number) {
      case 1:
        {
          // titre
          return Text(ressource.titre);
        }
      case 2:
        {
          // entête d'article
          return Text(ressource.titre);
        }
      case 3:
        {
          // image principale
          return Text("ImagePrincipale");
        }
      case 4:
        {
          // image secondaire
          return Text("ImageSecondaire");
        }
      case 5:
        {
          return Text("SimpleTexte");
        }
      default:
        {
          return SizedBox(
            width: 0,
            height: 0,
          );
        }
    }

    return Text("aaaaa");
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      //évite lors de l'utilisation du clavier pour les champs texte les problèmes de bottom over flow sur les pages
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Article"),
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
                  'assets/images/avatarmale2.jpg',
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey.shade100,
          padding: EdgeInsets.fromLTRB(10, 25, 10, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.transparent,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/avatarfemale.jpg',
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "CUISINE",
                    style: TextStyle(
                        color: CustomColors.MAIN_PURPLE,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Text("22/02/2022"),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "REPAS FRUITS ET LEGUME " + " par : BESSIE COOPER ",
                    style: TextStyle(
                        color: CustomColors.MAIN_PURPLE,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 250,
                    width: queryData.size.width * 0.8,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          image: DecorationImage(
                              image: AssetImage("assets/images/img2.jpg"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: queryData.size.width * 0.8,
                    height: 150,
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ornare est diam, et commodo ipsum egestas et. Suspendisse id nunc lectus. Donec elementum ipsum quis libero scelerisque, eu consequat enim viverra. Curabitur euismod fringilla purus cursus ultricies. Maecenas porta lacinia nisl et efficitur. Etiam hendrerit nec risus at laoreet. Fusce vitae sagittis diam, et consequat nulla.",
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.justify,
                      style: new TextStyle(
                        fontSize: 13,
                      ),
                      maxLines: 10,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 150,
                    width: queryData.size.width * 0.8,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          image: DecorationImage(
                              image: AssetImage("assets/images/img2.jpg"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: queryData.size.width * 0.8,
                    height: 200,
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ornare est diam, et commodo ipsum egestas et. Suspendisse id nunc lectus. Donec elementum ipsum quis libero scelerisque, eu consequat enim viverra. Curabitur euismod fringilla purus cursus ultricies. Maecenas porta lacinia nisl et efficitur. Etiam hendrerit nec risus at laoreet. Fusce vitae sagittis diam, et consequat nulla.",
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.justify,
                      style: new TextStyle(
                        fontSize: 13,
                      ),
                      maxLines: 10,
                    ),
                  ),
                  Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text("40"),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.message_outlined),
                              color: CustomColors.MAIN_PURPLE),
                        ],
                      ),
                      Row(
                        children: [
                          Text("51"),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.share_outlined),
                              color: CustomColors.MAIN_PURPLE),
                        ],
                      ),
                      Row(
                        children: [
                          Text("30"),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.thumb_up_alt_outlined),
                              color: CustomColors.MAIN_PURPLE),
                        ],
                      )
                    ],
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
