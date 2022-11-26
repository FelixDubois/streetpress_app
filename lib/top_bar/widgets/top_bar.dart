import 'package:flutter/material.dart';
import 'package:streetpress/themes/color.dart';

class TopBar extends StatefulWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: StreetPressColors.yellow,
      title: Center(
        child: Image.asset(
          "assets/images/head_logo.png",
          scale: 1.5,
        ),
      ),
      /*leading: IconButton(
        icon: const Icon(
          Icons.menu,
          color: StreetPressColors.black,
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.search,
            color: StreetPressColors.black,
          ),
          onPressed: () {},
        ),
      ],*/
    );
  }
}
