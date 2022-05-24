import 'package:cube/classes/couleurs/classe_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageEditProfil extends StatefulWidget {
  const PageEditProfil({Key? key}) : super(key: key);

  @override
  _PageEditProfilState createState() => _PageEditProfilState();
}

class _PageEditProfilState extends State<PageEditProfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editer Profil @Pseudo"),
        titleTextStyle: TextStyle(color: CustomColors.MAIN_PURPLE),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
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
        child: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: CircleAvatar(
                        maxRadius: 60,
                        minRadius: 30,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/avatarmale.jpg',
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.grey.shade100,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                            maxLines: 17,
                            decoration:
                                InputDecoration.collapsed(hintText: "ma bio"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Flexible(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.green,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            textStyle: TextStyle(
                                fontSize: 15, color: CustomColors.MAIN_PURPLE),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Sauvegarder",
                            style: TextStyle(color: CustomColors.MAIN_PURPLE),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
