import 'package:flutter/material.dart';

class ResourceComponent extends StatefulWidget {
  const ResourceComponent({Key? key}) : super(key: key);

  @override
  _ResourceComponentState createState() => _ResourceComponentState();
}

class _ResourceComponentState extends State<ResourceComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(width: MediaQuery.of(context).size.width * (1 / 12), height: 50,),
          Container(
            width: MediaQuery.of(context).size.width * (2 / 12),
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
              minRadius: 30,
              backgroundImage: NetworkImage(
                  "https://pbs.twimg.com/profile_images/1401657227979726848/kJlqrSrp_400x400.jpg"),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5),
            width: MediaQuery.of(context).size.width * (8 / 12),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * (8 / 12) * (6/10),
                      child: Text("Gabriel DELAHAYE", style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 1),),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * (8 / 12) * (2/10),
                      child: Text("12/01/2022", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * (8 / 12) * (2/10),
                      child: IconButton(icon: Icon(Icons.more_vert), onPressed: () {},),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * (8 / 12),
                  child: Text("Sport", style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 1),),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 5),
                  child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi id molestie urna, eu sagittis sapien. Sed finibus nisl vitae risus pharetra euismod. [...]'),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child:  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                      height: 110,
                      width: MediaQuery.of(context).size.width * (8 / 12),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 2),
                  width: MediaQuery.of(context).size.width * (8 / 12),
                  alignment: Alignment.bottomRight,
                  child: Text('Voir plus'),
                ),
                Container(
                    padding: EdgeInsets.only(bottom: 10),
                    width: MediaQuery.of(context).size.width * (8 / 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              IconButton(onPressed: () {}, icon: Icon(Icons.comment_outlined, size: 20)),
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                child: Text('125'),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              IconButton(onPressed: () {}, icon: Icon(Icons.swap_horizontal_circle_outlined, size: 20)),
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                child: Text('426'),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline, size: 20)),
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                child: Text('1.5K'),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                ),
              ],
            ),
          ),
          Container(width: MediaQuery.of(context).size.width * (1 / 12), height: 50,),
        ],
      ),
    );
  }
}
