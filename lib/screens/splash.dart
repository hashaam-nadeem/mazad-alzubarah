import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zubara/screens/languageScreen.dart';
import 'package:zubara/utils/Colors.dart';
import 'package:zubara/utils/routes.dart';

class Splash extends StatefulWidget {
  var navigatorKey;
  Splash({this.navigatorKey});
  @override
  _Splash createState() => new _Splash();
}

class _Splash extends State<Splash> with SingleTickerProviderStateMixin {
  var token, lat, long;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  AnimationController _animationController;
  double currentValue;
  Animation curveAnimation;

  startTime() async {
    var duration = new Duration(seconds: 3);
    return Timer(duration, navigationpage);
  }

  void navigationpage() {
    AppRoutes.replace(context, LanguageScreen());
  }

  // _splashdelay() async {
  //   _animationController =
  //       AnimationController(duration: Duration(seconds: 4), vsync: this);
  //   curveAnimation = CurvedAnimation(
  //     parent: _animationController,
  //     curve: Curves.elasticInOut,
  //   );
  //   _animationController.addListener(() {
  //     if (_animationController.isCompleted) {
  //       _animationController.dispose();
  //       navigationpage();
  //     }
  //   });
  //   _animationController.forward();
  // }

  @override
  void initState() {
    super.initState();

    startTime();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).bottomAppBarColor,
      body:
          // Stack(
          //   children: [
          //     PositionedTransition(
          //         rect: RelativeRectTween(
          //                 begin: RelativeRect.fromLTRB(0, 0, 0, 600),
          //                 end: RelativeRect.fromLTRB(0, 0, 0, 0))
          //             .animate(curveAnimation),
          //         child: Container(
          //           margin: EdgeInsets.all(30),
          //           width: 100,
          //           height: 100,
          //           child: Image(
          //             image: AssetImage('images/'),
          //             color: mainColor,
          //             height: MediaQuery.of(context).size.height / 6,
          //           ),
          //           // decoration:
          //           //     BoxDecoration(color: Colors.black12, shape: BoxShape.circle),
          //         ))
          //   ],
          // ),
          Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(splashScreen), fit: BoxFit.fill)),
      ),
    );
  }
}
