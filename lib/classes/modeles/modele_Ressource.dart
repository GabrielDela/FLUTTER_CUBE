class Ressource {
  String nomUtilisateur;
  String prenomUtilisateur;
  String descriptionArticle;
  String lienVersImage;
  String dateTempo;
  int nbComment;
  int nbShare;
  int nbLike;
  String createdAt = "";
  String updatedAt = "";

  //constructeur
  Ressource(
      {required this.nomUtilisateur,
      required this.prenomUtilisateur,
      required this.descriptionArticle,
      required this.lienVersImage,
      required this.dateTempo,
      required this.nbComment,
      required this.nbShare,
      required this.nbLike,
      required this.createdAt,
      required this.updatedAt});
}
