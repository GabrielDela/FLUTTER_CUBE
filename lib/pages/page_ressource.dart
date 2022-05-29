import 'package:cube/classes/couleurs/classe_colors.dart';
import 'package:cube/widgets/Home/HomeAppBar.dart';
import 'package:flutter/material.dart';
// l'utilisation de l'alias est obligatoire sinon il y a confusion entre le widget Text natif de flutter et le widget Text de Quill
import 'package:flutter_quill/flutter_quill.dart' as Quill;

class PageRessources extends StatefulWidget {
  const PageRessources({Key? key}) : super(key: key);

  @override
  State<PageRessources> createState() => _PageRessourcesState();
}

class _PageRessourcesState extends State<PageRessources> {
  //String dropdownValue = 'One';
  // l'utilisation de l'alias est obligatoire  pour  l'utilisation de tout les widget de quill
  Quill.QuillController _controller = Quill.QuillController.basic();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Ressource"),
        centerTitle: true,
        backgroundColor: CustomColors.MAIN_PURPLE,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/avatarmale2.jpg',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
