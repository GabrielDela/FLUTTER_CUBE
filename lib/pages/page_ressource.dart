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
      //évite lors de l'utilisation du clavier pour les champs texte les problèmes de bottom over flow sur les pages
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Ressource"),
        centerTitle: true,
        backgroundColor: CustomColors.MAIN_PURPLE,
      ),
      body: Column(
        children: [
          Quill.QuillToolbar.basic(controller: _controller),
          Container(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                textStyle:
                    TextStyle(fontSize: 15, color: CustomColors.MAIN_PURPLE),
              ),
              onPressed: () {},
              child: Text(
                "Sauvegarder",
                style: TextStyle(color: CustomColors.MAIN_PURPLE),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 600,
              child: Quill.QuillEditor.basic(
                controller: _controller,
                readOnly: false, // true for view only mode
              ),
            ),
          )
        ],
      ),
    );
  }
}
