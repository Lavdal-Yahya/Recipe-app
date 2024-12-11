import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  final int selectedItem;
  final Function(int) ontap;
  const BottomNavBar(
      {super.key, required this.ontap, required this.selectedItem});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.grey[100],
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * .015, vertical: h * .01),
        child: GNav(
          gap: 10,
          tabBorderRadius: 100,
          backgroundColor: Colors.grey[100]!,
          activeColor: Colors.white,
          color: Color(0xFFFF5757),
          tabBackgroundColor: Color(0xFFFF5757),
          iconSize: 30,
          textSize: 18,
          padding: EdgeInsets.symmetric(horizontal: w * .01, vertical: h * .01),
          tabs: [
            GButton(
              icon: CupertinoIcons.home,
              text: "Home",
            ),
            GButton(
              icon: CupertinoIcons.square_grid_2x2,
              text: "Categories",
            ),
            GButton(
              icon: CupertinoIcons.search,
              text: "Search",
            ),
            GButton(
              icon: CupertinoIcons.heart,
              text: "Favorites",
            ),
            GButton(
              icon: CupertinoIcons.shopping_cart,
              text: "Ingredients",
            ),
          ],
          onTabChange: widget.ontap,
          selectedIndex: 0,
          curve: Curves.bounceIn,
        ),
      ),
    );
  }
}
