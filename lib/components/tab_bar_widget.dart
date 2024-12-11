import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              color: Colors.white,
              height: h * 0.05,
              child: TabBar(
                  unselectedLabelColor: Color(0xFFFF5757),
                  labelColor: Colors.white,
                  dividerColor: Colors.white,
                  indicator: BoxDecoration(
                    color: Color(0xFFFF5757),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  labelPadding: EdgeInsets.symmetric(horizontal: w * 0.012),
                  tabs: [
                    TabItem(title: "Breakfast"),
                    TabItem(title: "Lunch"),
                    TabItem(title: "Dinner"),
                    TabItem(title: "Snack"),
                  ]))
        ],
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final String title;
  const TabItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFFA4C4C),
          ),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 10),
          ),
        ),
      ),
    );
  }
}

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SizedBox(
      height: h * 0.28,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {},
        separatorBuilder: (context, index) {
          return SizedBox(width: 15);
        },
        itemCount: 3,
      ),
    );
  }
}
