import 'package:flutter/material.dart';
import 'package:recipe_app/constants/iamges_paths.dart';

class PageHeading extends StatelessWidget {
  const PageHeading({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Stack(children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Color(0xFFCF3E00),
              ))
        ],
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          IamgesPaths.appLogo,
          width: w * .2,
        ),
      ]),
    ]);
  }
}
