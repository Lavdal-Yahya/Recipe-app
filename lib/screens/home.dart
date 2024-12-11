import 'package:flutter/material.dart';
import 'package:recipe_app/components/bottom_nav_bar.dart';
import 'package:recipe_app/screens/home_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController pageController;
  int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
          ontap: (index) {
            pageController.animateToPage(index,
                duration: Duration(milliseconds: 300),
                curve: Curves.bounceInOut);
            setState(() {
              currentIndex = index;
            });
          },
          selectedItem: currentIndex),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(),
          Center(
            child: Text("Page2"),
          ),
          Center(
            child: Text("Page3"),
          ),
          Center(
            child: Text("Page4"),
          ),
          Center(
            child: Text("Page5"),
          ),
        ],
      ),
    );
  }
}
