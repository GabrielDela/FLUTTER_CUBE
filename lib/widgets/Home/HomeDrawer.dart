import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../classes/couleurs/classe_colors.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColors.MAIN_COLOR,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Row(
              children: const [
                Icon(
                  Icons.account_circle,
                  size: 50,
                  semanticLabel: "Profil",
                ),
              ],
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Akudama.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Card(
            color: CustomColors.CARD_COLOR,
            child: ListTile(
              leading: const FlutterLogo(size: 56.0),
              title: const Text('Amis'),
              subtitle: const Text("Nombre d'amis"),
              trailing: const Icon(
                Icons.more_vert,
              ),
              onTap: () {
                if (kDebugMode) {
                  print("J'appuie");
                }
              },
            ),
          ),
          Card(
            color: CustomColors.CARD_COLOR,
            child: ListTile(
              leading: const FlutterLogo(size: 56.0),
              title: const Text('Messages'),
              subtitle: const Text('Nb messages non lus'),
              trailing: const Icon(
                Icons.more_vert,
              ),
              onTap: () {
                if (kDebugMode) {
                  print("J'appuie");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
