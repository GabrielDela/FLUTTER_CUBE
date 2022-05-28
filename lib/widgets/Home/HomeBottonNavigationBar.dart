import 'package:cube/classes/couleurs/classe_colors.dart';
import 'package:flutter/material.dart';

class HomeBottomNavigationBar extends StatefulWidget {
  HomeBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _HomeBottomNavigationBarState createState() =>
      _HomeBottomNavigationBarState();
}

class _HomeBottomNavigationBarState extends State<HomeBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: CustomColors.MAIN_PURPLE,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          tooltip: "Menu principal",
          backgroundColor: CustomColors.MAIN_PURPLE,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_to_photos_rounded),
          label: 'Ajouter',
          tooltip: "Ajouter",
          backgroundColor: CustomColors.MAIN_PURPLE,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          label: 'Favoris',
          tooltip: "Favoris",
          backgroundColor: CustomColors.MAIN_PURPLE,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Compte',
          backgroundColor: CustomColors.MAIN_PURPLE,
        ),
      ],
      // currentIndex: _selectedIndex,
      selectedItemColor: CustomColors.BOTTOMNAV_ITEMS_COLOR,
      // onTap: _onItemTapped,
    );
  }
}
