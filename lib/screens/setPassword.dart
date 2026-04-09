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

class SetPassword extends StatefulWidget {
  int screen;
  SetPassword({@required this.screen});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _languageScreen();
  }
}

class _languageScreen extends State<SetPassword> {
  var width, height;
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: mainColor,
      appBar: RegistrationAppBar(
        height: height * .25,
        context: context,
        languagePage: false,
        title: "Set Password",
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
                    keyboardTypenumeric: false,
                    controller: password,
                    width: width * .85,
                    number: true,
                    title: "Password",
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
                    controller: confirmPassword,
                    width: width * .85,
                    keyboardTypenumeric: false,
                    number: false,
                    title: "Confirm Password",
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
                      if (password.text.isEmpty ||
                          confirmPassword.text.isEmpty) {
                        constValues().toast(
                            "${getTranslated(context, "required_field")}",
                            context);
                      } else if (password.text.length < 8 ||
                          confirmPassword.text.length < 8) {
                        constValues().toast(
                            "${getTranslated(context, "must8")}", context);
                      } else if (password.text != confirmPassword.text) {
                        constValues().toast(
                            "${getTranslated(context, "not_match")}", context);
                      } else {
                        APIHELPER()
                            .setPassword(password.text, widget.screen, context)
                            .then((value) {
                          if (!value['error']) {
                            print("valid");
                            UserDataModel userDataModel = UserDataModel();
                            setState(() {
                              userDataModel =
                                  UserDataModel.fromJson(value['data']);
                              User.userData.token = value['token'];
                              User.userData.userResult = userDataModel.result;
                            });

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
                    },
                    child: CustomButton(
                      width: width * .6,
                      height: height * .06,
                      color: lightGolden,
                      title: "Confirm",
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height * .03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
