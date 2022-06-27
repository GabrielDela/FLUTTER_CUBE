import 'package:cube/classes/couleurs/classe_colors.dart';
import 'package:cube/controller/authController.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageModifierBio extends StatefulWidget {
  const PageModifierBio({Key? key}) : super(key: key);

  @override
  State<PageModifierBio> createState() => _PageModifierBioState();
}

class _PageModifierBioState extends State<PageModifierBio> {
  TextEditingController bio = new TextEditingController();
  String id = "";

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = prefs.getString('userId');
    if (stringValue != null) {
      setState(() {
        id = stringValue;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getStringValuesSF();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modifier la biographie"),
        centerTitle: true,
        backgroundColor: CustomColors.MAIN_PURPLE,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: Text(
                "Nouvelle biographie",
                style: TextStyle(
                    color: CustomColors.MAIN_PURPLE,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Flexible(
              child: Container(
                width: queryData.size.width * 0.8,
                padding: EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  controller: bio,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.black),
                      ),
                      hintText: 'Biographie',
                      hintStyle: TextStyle(color: Colors.black),
                      contentPadding: EdgeInsets.all(10),
                      enabled: true),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Flexible(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle:
                      TextStyle(fontSize: 15, color: CustomColors.MAIN_PURPLE),
                ),
                onPressed: () {
                  AuthController.patchBiographie(id, bio.text);
                  final snackBar = SnackBar(
                    content: const Text('Sauvegarde effectuée !'),
                    action: SnackBarAction(
                      label: 'Ok',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Text(
                  "Sauvegarder",
                  style: TextStyle(color: CustomColors.MAIN_PURPLE),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
