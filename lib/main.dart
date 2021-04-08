import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zubara/screens/splash.dart';
import 'package:zubara/utils/Colors.dart';
import 'package:overlay_support/overlay_support.dart';

void main() async {
  runApp(MyApp());
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: mainColor, systemNavigationBarColor: mainColor));
    return OverlaySupport(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "tajawal",
          primaryColor: mainColor,
          accentColor: secondaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Splash(),
      ),
    );
  }
}
