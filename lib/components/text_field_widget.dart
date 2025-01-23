import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const TextFieldWidget({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      height: h * .06,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [BoxShadow(color: Colors.black26, offset: Offset(0, 1), blurRadius: 2)]),
      child: TextField(
        style: TextStyle(
          fontSize: w * 0.04,
          color: Colors.black,
        ),
        onChanged: onChanged, // Callback for search input
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: "What's cooking in your mind...?",
          hintStyle: TextStyle(color: Colors.grey, fontSize: w * .03),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: Icon(
            Icons.search,
            color: const Color(0xffeb4600),
            size: w * .07,
          ),
        ),
      ),
    );
  }
}
