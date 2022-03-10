import 'package:cube/LayoutComponent.dart';
import 'package:cube/ResourceComponent.dart';
import 'package:cube/SeparatorComponent.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  int? index;
  HomePage({Key? key, int? indexParam}) : super(key: key){
    index = indexParam;
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutComponent(
      indexParam: widget.index,
      contentParam: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ResourceComponent(),
            SeparatorComponent(),
            ResourceComponent(),
            SeparatorComponent(),
            ResourceComponent(),
            SeparatorComponent(),
          ],
        ),
      ),
    );
  }
}
