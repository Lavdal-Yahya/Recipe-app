import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      height: h * .06,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(14), boxShadow: [
        BoxShadow(color: Colors.black26, offset: Offset(0, 1), blurRadius: 2)
      ]),
      child: TextField(
        style: TextStyle(
          fontSize: w * 0.04,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: "What's coocking in your minde...?",
          hintStyle: TextStyle(color: Colors.grey, fontSize: w * .03),
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: Icon(
            Icons.search,
            color: Colors.indigo[700],
            size: w * .07,
          ),
        ),
      ),
    );
  }
}
