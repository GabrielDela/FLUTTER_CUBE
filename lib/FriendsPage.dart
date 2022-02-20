import 'package:cube/class/CustomColor.dart';
import 'package:cube/main.dart';
import 'package:flutter/material.dart';

import 'package:cube/class/AuthController.dart';
import 'package:cube/class/Friends.dart';




class FriendsPage extends StatefulWidget {
  const FriendsPage({Key? key}) : super(key: key);



  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {

  dynamic friends = Friends.GetFriends(AuthController.user["_id"]);

 String search = "";
  //remettre les amis dans la liste pour l'affichage : getAllFriendFromPersonne(id) quand il y aura la database

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mes Amis"),
        centerTitle: true,
        backgroundColor: CustomColors.MAIN_COLOR,
        actions: <Widget>[
          Padding(padding: EdgeInsets.only(right:8),
            child: CircleAvatar(
              radius:25,
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: Image.network(
                  'https://franchisematch.com/wp-content/uploads/2015/02/john-doe.jpg',
                ),
              ),
            )
          ),
        ],
      ),

      body:Center(
         child:  Column (
          children: [
            Expanded(
              flex: 2,
              child :
              TextField(
                onSubmitted: (value) {
                    setState(() {
                      search = value;
                      print(search);
                    });
                  },
                  obscureText: false,
                  decoration: InputDecoration(
                      labelText: 'Recherche',
                      icon: Icon(Icons.search,)
                  )
              ),
            ),
            Expanded(
              flex: 10,
              child: Scrollbar(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  for (var friend in friends)
                    if(search == "" || friend["firstname"].contains(search)  || friend["lastname"].contains(search))
                    ListTile(
                      leading: ExcludeSemantics(
                        child: CircleAvatar(radius:25,
                          backgroundColor: Colors.transparent,
                          child: ClipOval(
                            child: Image.network(
                              'https://franchisematch.com/wp-content/uploads/2015/02/john-doe.jpg',
                            ),
                          ),
                        ),
                      ),
                      title: Text(friend["firstname"] +" "+ friend["lastname"]),
                    ),//ListTile
                ],//children
              ),
            ),)
          ]
         )
      )
    );
  }
}
