import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zubara/screens/login.dart';
import 'package:zubara/screens/signup.dart';
import 'package:zubara/utils/Colors.dart';
import 'package:zubara/utils/customButton.dart';
import 'package:zubara/utils/registrationAppbar.dart';
import 'package:zubara/utils/routes.dart';
import 'package:zubara/utils/textstyle.dart';

class LanguageScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _languageScreen();
  }
}

class _languageScreen extends State<LanguageScreen> {
  var width, height;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: mainColor,
      appBar: RegistrationAppBar(
        height: height * .25,
        languagePage: true,
        title: "Get Started",
        pop: false,
      ),
      body: Container(
        width: width,
        height: height,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  logoImage,
                  width: width * .7,
                  height: height * .2,
                  fit: BoxFit.fill,
                )
              ],
            ),
            SizedBox(
              height: height * .06,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    AppRoutes.push(context, LoginScreen());
                  },
                  child: CustomButton(
                    width: width * .6,
                    height: height * .08,
                    color: lightGolden,
                    title: "Sign In",
                  ),
                )
              ],
            ),
            SizedBox(
              height: height * .02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    AppRoutes.push(context, SignUpScreen());
                  },
                  child: CustomButton(
                    width: width * .6,
                    height: height * .08,
                    color: lightGolden,
                    title: "Sign Up",
                  ),
                )
              ],
            ),
            SizedBox(
              height: height * .02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Sign in as a Guest",
                    style: headingStyle.copyWith(color: lightGolden),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
