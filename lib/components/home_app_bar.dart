import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Row(children: [
      Text("Wat are you\ncoocking today?",
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Pacifico',
              fontSize: w * .07,
              height: 1)),
              Spacer()
    ]);
  }
}
