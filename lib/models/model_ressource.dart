class Ressource {
  String? nomUtilisateur;
  String? prenomUtilisateur;
  String? descriptionArticle;
  String? dateTempo;
  int? nbComment;
  int? nbShare;
  int? nbLike;
  String? lienVersImage;

  Ressource({
    required this.nomUtilisateur,
    required this.prenomUtilisateur,
    required this.descriptionArticle,
    required this.dateTempo,
    required this.nbComment,
    required this.nbLike,
    required this.nbShare,
    required this.lienVersImage,
  });
}
