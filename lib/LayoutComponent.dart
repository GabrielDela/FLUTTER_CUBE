import 'package:cube/BottomNavigationComponent.dart';
import 'package:cube/DrawerComponent.dart';
import 'package:cube/ProfilePage.dart';
import 'package:cube/class/CustomColor.dart';
import 'package:flutter/material.dart';

class LayoutComponent extends StatefulWidget {
  Widget? content;
  int? index;

  LayoutComponent({Key? key, Widget? contentParam, int? indexParam})
      : super(key: key) {
    content = contentParam;
    index = indexParam;
  }

  @override
  _LayoutComponentState createState() => _LayoutComponentState();
}

class _LayoutComponentState extends State<LayoutComponent> {
  Widget? content;
  int index = 0;

  @override
  void initState() {
    content = widget.content;
    index = widget.index != null ? widget.index! : 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors.MAIN_COLOR,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child:
              content ?? const Text('Hello, this is a routed default page !'),
        ),
        drawer: const DrawerComponent(),
        bottomNavigationBar: BottomNavigationComponent(indexParam: index)
    );
  }
}
