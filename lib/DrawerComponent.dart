import 'package:cube/LoginPage.dart';
import 'package:cube/RegisterPage.dart';
import 'package:cube/TestPage.dart';
import 'package:cube/class/CustomColor.dart';
import 'package:flutter/material.dart';

class DrawerComponent extends StatefulWidget {
  const DrawerComponent({Key? key}) : super(key: key);

  @override
  _DrawerComponentState createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColors.SECOND_COLOR,
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: new Text("Navigation", style: TextStyle(color: Colors.white),),
            decoration: BoxDecoration(color: CustomColors.MAIN_COLOR),
          ),
          ListTile(
            title: new Text("First Page", style: TextStyle(color: Colors.white),),
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
          ListTile(
            title: new Text("Second Page", style: TextStyle(color: Colors.white),),
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => RegisterPage()),
              );
            },
          ),
          ListTile(
            title: new Text("Third Page", style: TextStyle(color: Colors.white),),
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => TestPage()),
              );
            },
          ),
        ],
      )
    );
  }
}
