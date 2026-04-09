import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:zubara/API/basehelper.dart';
import 'package:zubara/dashboard/mainscreen.dart';
import 'package:zubara/languagedata/language_constants.dart';
import 'package:zubara/model/singleton.dart';
import 'package:zubara/model/userdetailmodel.dart';
import 'package:zubara/screens/signup.dart';
import 'package:zubara/utils/Colors.dart';
import 'package:zubara/utils/const.dart';
import 'package:zubara/utils/customButton.dart';
import 'package:zubara/utils/customTextfield.dart';
import 'package:zubara/utils/registrationAppbar.dart';
import 'package:zubara/utils/routes.dart';
import 'package:zubara/utils/textstyle.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _languageScreen();
  }
}

class _languageScreen extends State<LoginScreen> {
  var width, height;
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
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
        title: "Login",
        pop: true,
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
                    controller: phone,
                    width: width * .85,
                    number: true,
                    keyboardTypenumeric: true,
                    title: "Mobile",
                    height: height * 08,
                  ),
                ],
              ),
              SizedBox(
                height: height * .03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    controller: password,
                    width: width * .85,
                    title: "Password",
                    number: false,
                    keyboardTypenumeric: false,
                    height: height * 08,
                  ),
                ],
              ),
              SizedBox(
                height: height * .03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (password.text.isEmpty || phone.text.isEmpty) {
                        constValues().toast(
                            "${getTranslated(context, "required_field")}",
                            context);
                      } else if (password.text.length < 8) {
                        constValues().toast(
                            "${getTranslated(context, "must8")}", context);
                      } else {
                        print(phone.text);
                        APIHELPER()
                            .login("+974${phone.text}", password.text, context)
                            .then((value) {
                          if (!value['error']) {
                            print("valid");
                            UserDataModel userDataModel = UserDataModel();
                            setState(() {
                              userDataModel =
                                  UserDataModel.fromJson(value['user']);
                              User.userData.token = value['token'];
                              User.userData.userResult = userDataModel.result;
                            });
                            constValues().setsharedpreferencedata(
                                User.userData.token, User.userData.lang);
                            AppRoutes.makeFirst(context, MainScreen());
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

                      // AppRoutes.push(context, LoginScreen());
                    },
                    child: CustomButton(
                      width: width * .6,
                      height: height * .06,
                      color: lightGolden,
                      title: "Sign In",
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height * .03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      AppRoutes.push(
                          context,
                          SignUpScreen(
                            screen: 1,
                          ));
                    },
                    child: Text(
                      "Forgot Password?  Recover Now",
                      style: headingStyle.copyWith(fontSize: height * .02),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * .03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      AppRoutes.replace(
                          context,
                          SignUpScreen(
                            screen: 0,
                          ));
                    },
                    child: Text(
                      "Don't have an account? Sign Up",
                      style: headingStyle.copyWith(
                          color: lightGolden,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
