import 'package:cube/classes/modeles/modele_Relation.dart';
import 'package:cube/controller/authController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cube/main.dart';

void main() {
  //Test avec un id existant
  test("suppression d'un user", () async {
    final bool =
        await AuthController.deleteUserById("62b98bce9210cfc53e84bbde");
    expect(bool, true);
  });
  //Test add ami
  test("ajout d'un ami", () async {
    final addAmi = await AuthController.addAmi(
        "62b98bce9210cfc53e84bbde", "62b98e35fac0d058527c009d");
    expect(addAmi, true);
  });
  //Test suppr ami
  test("suppression d'un ami", () async {
    final supprAmi = await AuthController.deleteAmi("62a7083197dfc7fd9a477f8b");
    expect(supprAmi, true);
  });
  //Test add ami
  test("suppression d'une ressource", () async {
    final supprRessource =
        await AuthController.deleteRessource("629ca2be859e064abfdbd434");
    expect(supprRessource, true);
  });
  test("ajout favoris", () async {
    final addFavoris = await AuthController.postFavoris(
        "62b98bce9210cfc53e84bbde", "629ca2be859e064abfdbd434");
    expect(addFavoris, true);
  });
  test("suppression d'un favoris", () async {
    final supprFavoris = await AuthController.deleteFavoris(
        "62b98bce9210cfc53e84bbde", "629ca2be859e064abfdbd434");
    expect(supprFavoris, true);
  });
  // TODO:test add user
  test("ajout d'un user", () async {
    final supprFavoris = await AuthController.deleteFavoris(
        "62b98bce9210cfc53e84bbde", "629ca2be859e064abfdbd434");
    expect(supprFavoris, true);
  });
  // TODO:test patch user
  test("patch d'un user", () async {
    final supprFavoris = await AuthController.deleteFavoris(
        "62b98bce9210cfc53e84bbde", "629ca2be859e064abfdbd434");
    expect(supprFavoris, true);
  });
  test("post d'une ressource", () async {
    final postRessource = await AuthController.postRessource("le titre",
        "la description", "l'image", "le contenu", "62b98bce9210cfc53e84bbde");
    expect(postRessource, true);
  });
}
