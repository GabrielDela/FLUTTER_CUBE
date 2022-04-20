import 'package:cube/widgets/Home/HomeAppBar.dart';
import 'package:flutter/material.dart';

class PageRessources extends StatefulWidget {
  const PageRessources({Key? key}) : super(key: key);

  @override
  State<PageRessources> createState() => _PageRessourcesState();
}

class _PageRessourcesState extends State<PageRessources> {
  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child:
                Text("Création de ressource", style: TextStyle(fontSize: 30)),
          ),
          DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>['One', 'Two', 'Free', 'Four']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
