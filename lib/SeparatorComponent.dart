import 'package:flutter/material.dart';

class SeparatorComponent extends StatefulWidget {
  const SeparatorComponent({Key? key}) : super(key: key);

  @override
  _SeparatorComponentState createState() => _SeparatorComponentState();
}

class _SeparatorComponentState extends State<SeparatorComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 1,
      color: Colors.black12,
    );
  }
}
