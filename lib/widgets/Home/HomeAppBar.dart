import 'package:cube/classes/couleurs/classe_colors.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatefulWidget with PreferredSizeWidget {
  final String text;

  HomeAppBar({Key? key, required this.text}) : super(key: key);
  @override
  _HomeAppBarState createState() => _HomeAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.text),
      centerTitle: true,
      backgroundColor: CustomColors.MAIN_PURPLE,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
    );
  }
}
