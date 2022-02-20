import 'package:cube/class/AuthController.dart';
import 'package:cube/FriendsPage.dart';

import 'package:cube/class/CustomColor.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: CustomColors.MAIN_COLOR,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only( bottom: 40),
                  width: MediaQuery.of(context).size.width,
                  child: const Text("Connectez-vous à CUBE", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600, letterSpacing: 2), textAlign: TextAlign.center,),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  child: OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      side: MaterialStateProperty.all(
                          const BorderSide(
                              color: Colors.black87,
                              width: 1,
                              style: BorderStyle.solid
                          )
                      ),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                    ),
                    onPressed: () => {},
                    child: const Text('Se connecter avec Google', style: TextStyle(color: Colors.black, fontSize: 18),),
                  ),
                ),

                // Container(
                //   width: MediaQuery.of(context).size.width,
                //   height: 45,
                //   child: OutlinedButton(
                //     style: ButtonStyle(
                //       backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                //       side: MaterialStateProperty.all(
                //           const BorderSide(
                //               color: Colors.black87,
                //               width: 1,
                //               style: BorderStyle.solid
                //           )
                //       ),
                //       shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                //     ),
                //     onPressed: () => {},
                //     child: const Text('Se connecter avec Apple', style: TextStyle(color: Colors.black, fontSize: 18),),
                //   ),
                // ),
                Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 25),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 2,
                        color: Colors.white10,
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                      const Text('OU', style: TextStyle(color: Colors.white54, fontSize: 18),),
                      Container(
                        height: 2,
                        color: Colors.white10,
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 15),
                  child: TextField(
                    onChanged: (text) => {
                      email = text
                    },
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white54, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white24, width: 2.0),
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(fontSize: 18, color: Colors.white54),
                    ),
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(top: 0, bottom: 15),
                  child: TextField(
                    onChanged: (text) => {
                      password = text
                    },
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white54, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white24, width: 2.0),
                      ),
                      hintText: "Mot de passe",
                      hintStyle: TextStyle(fontSize: 18, color: Colors.white54),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  child: OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      side: MaterialStateProperty.all(
                          const BorderSide(
                              color: Colors.black87,
                              width: 1,
                              style: BorderStyle.solid
                          )
                      ),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                    ),
                    onPressed: () => { 
                      login().then(() => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const FriendsPage()),
                          ),
                      })


                      // if(login()){
                        
                      // } 
                      },
                    child: const Text('Suivant', style: TextStyle(color: Colors.black, fontSize: 18),),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  child: OutlinedButton(
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                          const BorderSide(
                              color: Colors.white30,
                              width: 2,
                              style: BorderStyle.solid
                          )
                      ),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                    ),
                    onPressed: () => {},
                    child: const Text('Mot de passe oublié ?', style: TextStyle(color: Colors.white54, fontSize: 18),),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width,
                  child: const Text("Vous n'avez pas de compte ?", style: TextStyle(color: Colors.white54, fontSize: 18)),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      null;
                    },
                    child: const Text("Inscrivez-vous",
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: 16
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> login() async {
    bool response = false;
    response = await AuthController.login(email, password);
    if(response){
      response = await AuthController.me();
      if(response){ //On a les info du mec login dans la variable AuthController.user
        print("Logged in");
        return true;
      }
      else{
        print("N'arrive pas a retrouver l'utilisateur en bdd ?");
        return false;
      }
    }
    else{
      print("Pas log pas pas bon credentials");
      return false;
    }
    return false;
  }
}
