import 'package:cube/classes/couleurs/classe_colors.dart';
import 'package:cube/pages/page_actualite.dart';
import 'package:cube/pages/page_ami.dart';
import 'package:cube/pages/page_favoris.dart';
import 'package:cube/pages/page_profil.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColors.MAIN_PURPLE,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: CustomColors.MAIN_PURPLE,
            ),
            accountName: Text("John Doe"),
            accountEmail: Text("@johndoe"),
            currentAccountPicture: CircleAvatar(
              maxRadius: 50,
              minRadius: 30,
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/avatarfemale.jpg',
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.favorite_outline_sharp,
              color: CustomColors.DRAWER_TEXT_COLOR,
            ),
            title: const Text(
              'Favoris',
              style: TextStyle(
                color: CustomColors.DRAWER_TEXT_COLOR,
              ),
            ),
            trailing: const Icon(
              Icons.more_vert,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PageFavoris(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.people_outline,
              color: CustomColors.DRAWER_TEXT_COLOR,
            ),
            title: const Text(
              'Amis',
              style: TextStyle(
                color: CustomColors.DRAWER_TEXT_COLOR,
              ),
            ),
            trailing: const Icon(
              Icons.more_vert,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PageAmi(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.add_comment_outlined,
              color: CustomColors.DRAWER_TEXT_COLOR,
            ),
            title: const Text(
              'Créer une ressource',
              style: TextStyle(
                color: CustomColors.DRAWER_TEXT_COLOR,
              ),
            ),
            trailing: const Icon(
              Icons.more_vert,
            ),
            onTap: () {
              if (kDebugMode) {
                print("J'appuie");
              }
            },
          ),
          ListTile(
            leading: Icon(
              Icons.account_circle_outlined,
              color: CustomColors.DRAWER_TEXT_COLOR,
            ),
            title: const Text(
              'Mon profil',
              style: TextStyle(
                color: CustomColors.DRAWER_TEXT_COLOR,
              ),
            ),
            trailing: const Icon(
              Icons.more_vert,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PageProfil(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.newspaper_outlined,
              color: CustomColors.DRAWER_TEXT_COLOR,
            ),
            title: const Text(
              "Fil d'actualité",
              style: TextStyle(
                color: CustomColors.DRAWER_TEXT_COLOR,
              ),
            ),
            trailing: const Icon(
              Icons.more_vert,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PageActu(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
