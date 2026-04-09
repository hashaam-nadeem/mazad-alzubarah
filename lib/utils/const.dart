import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zubara/languagedata/language_constants.dart';
import 'package:zubara/utils/Colors.dart';

import '../main.dart';

class constValues {
  // void toast(String text, BuildContext context) {
  //   showToast('$text',
  //       context: context,
  //       borderRadius: BorderRadius.circular(10),
  //       curve: Curves.slowMiddle,
  //       textStyle: TextStyle(color: lightGolden, fontSize: 18),
  //       backgroundColor: Colors.black,
  //       animation: StyledToastAnimation.sizeFade,
  //       axis: Axis.horizontal,
  //       alignment: Alignment.center,
  //       position: StyledToastPosition.top);
  // }
  void toast(String text, BuildContext context) {
    Fluttertoast.showToast(
        msg: "$text",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1);
  }

  void setsharedpreferencedata(String token, String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
    await prefs.setString("language", language);
  }

  // void setLocationsharedpreferencedata(var lat, var long) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setDouble("lat", lat);
  //   await prefs.setDouble("long", long);
  //   await prefs.setString("address", User.userData.address);
  // }

  void changeLanguage(String language, BuildContext context) async {
    Locale _locale = await setLocale(language);
    MyApp.setLocale(context, _locale);
  }
}

TextStyle _textStyle(
    String fontFamily, Color color, double size, FontWeight fontWeight) {
  return TextStyle(
      fontFamily: fontFamily,
      color: color,
      fontSize: size,
      fontWeight: fontWeight);
}
