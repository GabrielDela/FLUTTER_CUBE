import 'package:cube/LayoutComponent.dart';
import 'package:cube/ProfileHeaderComponent.dart';
import 'package:cube/ResourceComponent.dart';
import 'package:cube/SeparatorComponent.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  int? index;

  ProfilePage({Key? key, int? indexParam}) : super(key: key) {
    index = indexParam;
  }

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutComponent(
      indexParam: widget.index,
      contentParam: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileHeaderComponent(),
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
