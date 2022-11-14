import 'package:flutter/material.dart';
import 'package:streetpress/bottom_bar/models/bottom_bar.dart';
import 'package:streetpress/pages/home_page.dart';
import 'package:streetpress/pages/money_page.dart';
import 'package:streetpress/themes/color.dart';
import 'package:streetpress/top_bar/widgets/top_bar.dart';

class BottomBar extends StatefulWidget {
  Pages currentPage = Pages.home;
  PageController pageController;

  BottomBar({Key? key, required this.pageController}) : super(key: key);

  //Pages current_page = Pages.home;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.video_collection),
          label: 'Videos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Map',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.money),
          label: 'Money',
        ),
      ],
      currentIndex: widget.currentPage.index,
      selectedItemColor: StreetPressColors.blue,
      unselectedItemColor: StreetPressColors.black,
      backgroundColor: StreetPressColors.yellow,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (int index) {
        setState(() {
          widget.currentPage = Pages.values[index];

          widget.pageController.jumpToPage(
            index,
          );
        });
      },
    );
  }
}
