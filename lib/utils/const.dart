import 'package:flutter/material.dart';

class constValues {
  // void toast(String text, BuildContext context) {
  //   showToast('$text',
  //       context: context,
  //       curve: Curves.easeIn,
  //       textStyle: TextStyle(color: Colors.white),
  //       backgroundColor: Colors.black,
  //       animation: StyledToastAnimation.slideFromLeft,
  //       axis: Axis.horizontal,
  //       alignment: Alignment.topCenter,
  //       position: StyledToastPosition.top);
  // }

  // void setsharedpreferencedata(String token, String language) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString("token", token);
  //   await prefs.setString("language", language);
  // }

  // void setLocationsharedpreferencedata(var lat, var long) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setDouble("lat", lat);
  //   await prefs.setDouble("long", long);
  //   await prefs.setString("address", User.userData.address);
  // }

  // void changeLanguage(String language, BuildContext context) async {
  //   Locale _locale = await setLocale(language);
  //   MyApp.setLocale(context, _locale);
  // }
}

TextStyle _textStyle(
    String fontFamily, Color color, double size, FontWeight fontWeight) {
  return TextStyle(
      fontFamily: fontFamily,
      color: color,
      fontSize: size,
      fontWeight: fontWeight);
}
