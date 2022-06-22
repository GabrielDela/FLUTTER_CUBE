import 'package:cube/classes/couleurs/classe_colors.dart';
import 'package:cube/controller/authController.dart';
import 'package:cube/widgets/Home/HomeAppBar.dart';
import 'package:flutter/material.dart';
// l'utilisation de l'alias est obligatoire sinon il y a confusion entre le widget Text natif de flutter et le widget Text de Quill
import 'package:flutter_quill/flutter_quill.dart' as Quill;
import 'package:shared_preferences/shared_preferences.dart';

class PageRessources extends StatefulWidget {
  const PageRessources({Key? key}) : super(key: key);

  @override
  State<PageRessources> createState() => _PageRessourcesState();
}

class _PageRessourcesState extends State<PageRessources> {
  //String dropdownValue = 'One';
  // l'utilisation de l'alias est obligatoire  pour  l'utilisation de tout les widget de quill
  final Quill.QuillController _controller = Quill.QuillController.basic();
  final Quill.QuillController _controllerImage = Quill.QuillController.basic();
  String id = "";
  TextEditingController titre = new TextEditingController();
  TextEditingController description = new TextEditingController();
  bool _validateDescription = false;
  bool _validateTitre = false;
  bool _validateContenu = false;
  bool _validateImage = false;

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = prefs.getString('userId');
    if (stringValue != null) {
      setState(() {
        id = stringValue;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getStringValuesSF();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
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
          Text(
            "Titre",
            style: TextStyle(
                color: CustomColors.MAIN_PURPLE,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          Flexible(
            child: Container(
              width: queryData.size.width * 0.8,
              padding: EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                controller: titre,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.black),
                    ),
                    hintText: 'Titre',
                    errorText: _validateTitre ? "Ne peut pas être vide" : null,
                    hintStyle: TextStyle(color: Colors.black),
                    contentPadding: EdgeInsets.all(10),
                    enabled: true),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Description",
            style: TextStyle(
                color: CustomColors.MAIN_PURPLE,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          Flexible(
            child: Container(
              width: queryData.size.width * 0.8,
              padding: EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                controller: description,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.black),
                    ),
                    hintText: 'Description',
                    errorText:
                        _validateDescription ? "Ne peut pas être vide" : null,
                    hintStyle: TextStyle(color: Colors.black),
                    contentPadding: EdgeInsets.all(10),
                    enabled: true),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Contenu",
            style: TextStyle(
                color: CustomColors.MAIN_PURPLE,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          Quill.QuillToolbar.basic(
            controller: _controller,
            multiRowsDisplay: false,
            locale: Locale("fr"),
          ),
          Expanded(
            child: Container(
              height: 600,
              child: Quill.QuillEditor.basic(
                controller: _controller,
                readOnly: false, // true for view only mode
              ),
              color: Colors.amber,
            ),
          ),
          Text(
            "Image",
            style: TextStyle(
                color: CustomColors.MAIN_PURPLE,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          Quill.QuillToolbar.basic(
            controller: _controllerImage,
            multiRowsDisplay: false,
            locale: Locale("fr"),
          ),
          Expanded(
            child: Container(
              height: 600,
              child: Quill.QuillEditor.basic(
                controller: _controllerImage,
                readOnly: false, // true for view only mode
              ),
              color: Colors.amber,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                titre.text.isEmpty
                    ? _validateTitre = true
                    : _validateTitre = false;
                description.text.isEmpty
                    ? _validateDescription = true
                    : _validateDescription = false;
                _controller.document.isEmpty()
                    ? _validateContenu = true
                    : _validateContenu = false;
                _controllerImage.document.isEmpty()
                    ? _validateImage = true
                    : _validateImage = false;
              });
              if (!_validateImage &&
                  !_validateContenu &&
                  !_validateDescription &&
                  !_validateTitre) {
                AuthController.postRessource(
                    titre.text,
                    description.text,
                    _controllerImage.document.toString(),
                    _controller.document.toString(),
                    id);
              }
            },
            child: Text('Envoyer'),
          )
        ],
      ),
    );
  }
}
