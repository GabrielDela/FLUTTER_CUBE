//classe d'exemple de ce qu'il pourrait y avoir dans un json
// si le json n'est pas fixe dans le sens on peut ajouter autant de widget qu'on veut il faudrait un json de ce type
// {
// "titre" : "mon titre",
// "prenom" : "Bessie",
// "nom" : "Cooper",
// "imagePrincipale" : "assets/images/monimage.png",
// "textArticle1" : "blablabla",
// "textArticle2" : "blablabla",
// "ImageSecondaire" : "assets/images/imagesSecondaire.png",
// Image3 : "assets/images/imagesSecondaire.png",
// TextEnPlus3 : "blalalblablabla"
//}

//Les 2 dernièeres propriétés seraient des widgets ajoutés par l'utilisateur : il faudrait que
//leur intitulé contienne les mots images et text par exemple
// et à chaque lecteur du fichier Json on créer soit un Objet Map à la volé en fonction de si la clé Json
// contient Text ou Image pour pouvoir afficher un rendu spécifique.

// NB : ici j'ai simplement créer une classe "démo" pour la partie front mais la fonction serait à écrire.

class RessourceJson {
  String nomUtilisateur;
  String prenomUtilisateur;
  String titre;
  String titreArticle;
  String textArticle1;
  String textArticle2;
  String ImagePrincipale;
  String ImageSecondaire;

  RessourceJson({
    required this.nomUtilisateur,
    required this.prenomUtilisateur,
    required this.titre,
    required this.titreArticle,
    required this.textArticle1,
    required this.textArticle2,
    required this.ImagePrincipale,
    required this.ImageSecondaire,
  });
}
