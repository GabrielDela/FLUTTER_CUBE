import 'package:cube/HomePage.dart';
import 'package:cube/ProfilePage.dart';
import 'package:cube/class/CustomColor.dart';
import 'package:flutter/material.dart';

class BottomNavigationComponent extends StatefulWidget {
  int? index;
  BottomNavigationComponent({Key? key, int? indexParam}) : super(key: key){
    index = indexParam;
  }

  @override
  _BottomNavigationComponentState createState() => _BottomNavigationComponentState();
}

class _BottomNavigationComponentState extends State<BottomNavigationComponent> {
  int index = 0;

  @override
  void initState() {
    index = widget.index != null ? widget.index! : 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: CustomColors.MAIN_COLOR,
      fixedColor: Colors.white,
      unselectedItemColor: Colors.white54,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: index,
      onTap: (index) => { redirect(index) },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: "Accueil"),
        BottomNavigationBarItem(icon: Icon(Icons.add_to_photos_outlined), activeIcon: Icon(Icons.add_to_photos), label: "Ressources"),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark_outline), activeIcon: Icon(Icons.bookmark), label: "Bibliothéque"),
        BottomNavigationBarItem(icon: Icon(Icons.person_outlined), activeIcon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }

  void redirect(int index){
    dynamic page;

    if(widget.index != index){
      switch(index){
        case 0:
          page = HomePage(indexParam: index);
          break;
        case 3:
          page = ProfilePage(indexParam: index);
          break;
      }

      if(page != null){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    }
  }
}
