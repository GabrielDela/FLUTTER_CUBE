import 'package:cube/class/classe_colors.dart';
import 'package:cube/pages/page_actualite.dart';
import 'package:cube/pages/page_favorites.dart';
import 'package:cube/pages/page_profile.dart';
import 'package:cube/pages/page_ressources.dart';
import 'package:cube/widgets/Home/HomeAppBar.dart';
import 'package:cube/widgets/Home/HomeBottonNavigationBar.dart';
import 'package:cube/widgets/Home/HomeDrawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  int _selectedIndex = 0;
  PageController? _pageController;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: _selectedIndex);
    super.initState();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  void onTabTapped(int index) {
    _pageController!.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  List<Widget> tabPages = [
    PageActu(),
    PageRessources(),
    PageFavoris(),
    PageMonProfil()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeDrawer(),
      appBar: const HomeAppBar(),
      body: PageView(
        children: tabPages,
        onPageChanged: _onItemTapped,
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: CustomColors.MAIN_COLOR,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            tooltip: "Home",
            backgroundColor: CustomColors.MAIN_COLOR,
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Ajouter',
            tooltip: "Ajouter",
            backgroundColor: CustomColors.MAIN_COLOR,
            activeIcon: Icon(Icons.add_box),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline_outlined),
            label: 'Favoris',
            tooltip: "Favoris",
            backgroundColor: CustomColors.MAIN_COLOR,
            activeIcon: Icon(Icons.bookmark),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Compte',
            tooltip: "Compte",
            backgroundColor: CustomColors.MAIN_COLOR,
            activeIcon: Icon(Icons.account_circle),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: CustomColors.BOTTOMNAV_ITEMS_COLOR,
        onTap: onTabTapped,
      ),
    );
  }
}
