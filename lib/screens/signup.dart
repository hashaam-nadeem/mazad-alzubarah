import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:zubara/API/basehelper.dart';
import 'package:zubara/languagedata/language_constants.dart';
import 'package:zubara/model/singleton.dart';
import 'package:zubara/screens/login.dart';
import 'package:zubara/screens/otp.dart';
import 'package:zubara/utils/Colors.dart';
import 'package:zubara/utils/const.dart';
import 'package:zubara/utils/customButton.dart';
import 'package:zubara/utils/customTextfield.dart';
import 'package:zubara/utils/registrationAppbar.dart';
import 'package:zubara/utils/routes.dart';
import 'package:zubara/utils/textstyle.dart';

class SignUpScreen extends StatefulWidget {
  int screen;
  SignUpScreen({@required this.screen});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _languageScreen();
  }
}

class _languageScreen extends State<SignUpScreen> {
  var width, height;
  TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: mainColor,
      appBar: RegistrationAppBar(
        context: context,
        height: height * .25,
        languagePage: false,
        title: "Sign Up",
        pop: false,
      ),
      body: Container(
        width: width,
        height: height,
        child: SingleChildScrollView(
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
                  CustomTextField(
                    width: width * .85,
                    controller: phone,
                    number: true,
                    title: "Mobile",
                    keyboardTypenumeric: true,
                    height: height * 08,
                  ),
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
                      if (phone.text.isEmpty) {
                        constValues().toast(
                            "${getTranslated(context, "required_field")}",
                            context);
                      } else {
                        APIHELPER()
                            .sendOtpUser(
                                "+974${phone.text}", widget.screen, context)
                            .then((value) {
                          if (!value['error']) {
                            print("valid");
                            setState(() {
                              User.userData.mobile = "+974${phone.text}";
                            });
                            AppRoutes.push(
                                context,
                                Otp(
                                  screen: widget.screen,
                                ));
                          } else {
                            constValues().toast(
                                "${getTranslated(context, "wrong")}", context);
                          }
                          print(value);
                        }).catchError((error) {
                          constValues().toast(
                              "${getTranslated(context, "wrong")}", context);
                        });
                      }
                      // AppRoutes.push(context, Otp());
                    },
                    child: CustomButton(
                      width: width * .6,
                      height: height * .06,
                      color: lightGolden,
                      title: "Proceed",
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height * .03,
              ),
              widget.screen == 0
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            AppRoutes.replace(context, LoginScreen());
                          },
                          child: Text(
                            "Already have an account?  Sign In",
                            style: headingStyle.copyWith(
                                color: lightGolden,
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
