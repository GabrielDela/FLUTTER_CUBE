import 'package:cube/classes/couleurs/classe_colors.dart';
import 'package:cube/pages/page_actualite.dart';
import 'package:cube/pages/page_favoris.dart';
import 'package:cube/pages/page_profil.dart';
import 'package:cube/pages/page_ressource.dart';
import 'package:cube/widgets/Home/HomeAppBar.dart';
import 'package:cube/widgets/Home/HomeBottonNavigationBar.dart';
import 'package:cube/widgets/Home/HomeDrawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  String _token = "";
  int _selectedIndex = 0;
  PageController? _pageController;

  Future<void> _loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _token = (prefs.getString('token') ?? ' **** no token **** ');
      print(
          "******************************MON TOKEN *************************" +
              _token);
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: _selectedIndex);
    _loadToken();
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
    PageProfil()
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
    );
  }
}
