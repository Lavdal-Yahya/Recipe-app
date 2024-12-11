import 'package:flutter/material.dart';
import 'package:recipe_app/screens/home.dart';
import '../constants/iamges_paths.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
        height: h,
        width: w,
        child: Stack(children: [
          Positioned(
            top: 0,
            child: Container(
              height: h * 0.79,
              width: w,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(IamgesPaths.onBoarding),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                height: h * 0.243,
                width: w,
                decoration: BoxDecoration(
                    color: Color(0xFFFF0A0E),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Let's Get To Coocking",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Pacifico',
                            )),
                        SizedBox(height: h * 0.03),
                        SizedBox(
                            height: h * 0.05,
                            width: w * 0.3,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Home()));
                                },
                                child: Text(
                                  "Log in",
                                  style: TextStyle(
                                      color: Color(0xFFFF0A0E),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ))),
                        SizedBox(height: h * 0.03),
                        SizedBox(
                            height: h * 0.05,
                            width: w * 0.3,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Home()));
                                },
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 92, 92, 92),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                )))
                      ]),
                ),
              ))
        ]),
      ),
    );
  }
}
