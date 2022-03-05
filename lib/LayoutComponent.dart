import 'package:cube/DrawerComponent.dart';
import 'package:cube/class/CustomColor.dart';
import 'package:flutter/material.dart';

class LayoutComponent extends StatefulWidget {
  Widget? content;
  LayoutComponent({Key? key, Widget? contentParam}) : super(key: key){
    content = contentParam;
  }

  @override
  _LayoutComponentState createState() => _LayoutComponentState();
}

class _LayoutComponentState extends State<LayoutComponent> {
  Widget? content;

  @override
  void initState() {
    content = widget.content;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: CustomColors.MAIN_COLOR,),
        body: Center(
          child: content != null ? content : Text('Hello, this is a routed default page !'),
        ),
        drawer: DrawerComponent()
    );
  }
}
