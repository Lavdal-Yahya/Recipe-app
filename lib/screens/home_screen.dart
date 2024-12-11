import 'package:flutter/material.dart';
import 'package:recipe_app/components/home_app_bar.dart';
import 'package:recipe_app/components/tab_bar_widget.dart';
import 'package:recipe_app/components/text_field_widget.dart';
import 'package:recipe_app/constants/iamges_paths.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeAppBar(),
              SizedBox(height: h * 0.025),
              TextFieldWidget(),
              SizedBox(height: h * 0.022),
              Center(
                child: Container(
                  height: h * 0.25,
                  width: w * .85,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(IamgesPaths.explore),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(24)),
                ),
              ),
              SizedBox(height: h * 0.025),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  "Categories",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                Text("See more",
                    style: TextStyle(
                        color: Colors.grey[600], fontWeight: FontWeight.w500))
              ]),
              TabBarWidget(),
            ],
          ),
        ),
      )),
    );
  }
}
