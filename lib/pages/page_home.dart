import 'package:cube/classes/couleurs/classe_colors.dart';
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
  static const List<Widget> _widgetOptions = <Widget>[
    IconButton(onPressed: null, icon: Icon(Icons.home)),
    IconButton(onPressed: null, icon: Icon(Icons.add_to_photos_rounded)),
    IconButton(onPressed: null, icon: Icon(Icons.bookmark)),
    IconButton(onPressed: null, icon: Icon(Icons.account_circle)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late Widget oui;
  @override
  void initState() {
    oui = HomeBottomNavigationBar(selectedIndex: _selectedIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeDrawer(),
      appBar: const HomeAppBar(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: oui,
    );
  }
}
