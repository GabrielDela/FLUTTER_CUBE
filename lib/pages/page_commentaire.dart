import 'package:flutter/material.dart';

class PageCommentaire extends StatefulWidget {
  const PageCommentaire({Key? key}) : super(key: key);

  @override
  _PageCommentaireState createState() => _PageCommentaireState();
}

class _PageCommentaireState extends State<PageCommentaire> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [Container()],
        ),
      ),
    );
  }
}
