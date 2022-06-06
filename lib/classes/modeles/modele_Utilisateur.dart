class Utilisateur {
  String id;
  bool activated;
  String firtsName;
  String lastName;
  String tag;
  String email;
  String password;
  String role;
  String typeRelation = "";

  //constructeur
  Utilisateur(
      {required this.id,
      required this.activated,
      required this.firtsName,
      required this.lastName,
      required this.tag,
      required this.email,
      required this.password,
      required this.role,
      required this.typeRelation});
}
