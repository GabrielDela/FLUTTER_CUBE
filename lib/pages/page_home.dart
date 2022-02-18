import 'package:cube/classes/couleurs/classe_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    IconButton(onPressed: null, icon: Icon(Icons.home)),
    IconButton(onPressed: null, icon: Icon(Icons.add_to_photos_rounded)),
    IconButton(onPressed: null, icon: Icon(Icons.bookmark)),
    IconButton(onPressed: null, icon: Icon(Icons.account_circle)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
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
      ),
      appBar: AppBar(
        title: const Text("Fil d'actualité"),
        centerTitle: true,
        backgroundColor: CustomColors.MAIN_COLOR,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: CustomColors.MAIN_COLOR,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            tooltip: "Menu principal",
            backgroundColor: CustomColors.MAIN_COLOR,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_to_photos_rounded),
            label: 'Ajouter',
            tooltip: "Ajouter",
            backgroundColor: CustomColors.MAIN_COLOR,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Favoris',
            tooltip: "Favoris",
            backgroundColor: CustomColors.MAIN_COLOR,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Compte',
            backgroundColor: CustomColors.MAIN_COLOR,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: CustomColors.BOTTOMNAV_ITEMS_COLOR,
        onTap: _onItemTapped,
      ),
    );
  }
}
