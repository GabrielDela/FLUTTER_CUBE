import 'package:cube/class/CustomColor.dart';
import 'package:flutter/material.dart';

class ProfileHeaderComponent extends StatefulWidget {
  dynamic data;

  ProfileHeaderComponent({Key? key, dynamic dataParam}) : super(key: key) {
    data = dataParam;
  }

  @override
  _ProfileHeaderComponentState createState() => _ProfileHeaderComponentState();
}

class _ProfileHeaderComponentState extends State<ProfileHeaderComponent> {
  dynamic data;

  @override
  void initState() {
    data = widget.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.SECOND_COLOR,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * (1 / 5),
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
              minRadius: 45,
              backgroundImage: NetworkImage(data?.img ??
                  "https://pbs.twimg.com/profile_images/1401657227979726848/kJlqrSrp_400x400.jpg"),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            width: MediaQuery.of(context).size.width * (4 / 5),
            child: Container(
              padding:
                  EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Gabriel DELAHAYE',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1),
                        ),
                        IconButton(
                          icon: Icon(Icons.person_remove),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Text(
                      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis.',
                      style: TextStyle(color: Colors.white70)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text('200 Relations',
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.white60)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
