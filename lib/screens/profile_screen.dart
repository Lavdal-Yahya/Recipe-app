import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/components/page_heading.dart';
import 'package:recipe_app/models/auth.dart';
import 'package:flutter/animation.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signout();
  }

  Widget _title() {
    return Text('FrieBase Auth');
  }

  Widget _userUid() {
    return Text(user?.email ?? 'User email');
  }

  Widget _signOutButton() {
    return ElevatedButton(onPressed: signOut, child: Text("Sing out"));
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height: h,
        width: w,
        child: Column(children: [
          PageHeading(),
          // Generated code for this Column Widget...
          Column(mainAxisSize: MainAxisSize.max, children: [
            Text(
              "Welcom Back!",
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 34,
                letterSpacing: 0.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.emoji_people_rounded,
              color: Colors.black,
              size: 100,
            ),
            SizedBox(height: h*.02),

            Container(
              width: 234,
              height: 43,
              decoration: BoxDecoration(
                color: Color(0x2BC1C1C1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Text(
                  "${user?.email}",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: h*.02),
            Container(
              width: 234,
              height: 43,
              decoration: BoxDecoration(
                color: Color(0x2BC1C1C1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Text(
                  "**********",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: h*.02),

            ElevatedButton(
              onPressed: () {
                signOut;
              },
              child: Text(
                'Sign out',
                style: TextStyle(
                  fontFamily: 'Inter Tight',
                  color: Colors.white,
                  letterSpacing: 0.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            ),
          ]),
        ]),
      ),
    );
  }
}
