import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zubara/components/maindrawer.dart';
import 'package:zubara/dashboard/bid.dart';
import 'package:zubara/dashboard/profile.dart';
import 'package:zubara/dashboard/watching.dart';
import 'package:zubara/screens/notification.dart';

import 'package:zubara/screens/purchase.dart';
import 'package:zubara/utils/Colors.dart';
import 'package:zubara/utils/routes.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return main();
  }
}

class main extends State<MainScreen> {
  var width, height;
  int index = 0;
  final _pageOptions = [
    Watching(),
    Purchase(),
    Bidding(),
    Profile(),
  ];
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        key: _scaffoldkey,
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // floatingActionButton: GestureDetector(
        //   onTap: () {},
        //   child: Container(
        //     width: width * .15,
        //     height: height * .08,
        //     decoration:
        //         BoxDecoration(shape: BoxShape.circle, color: darkGolden),
        //     child: Center(
        //       child: Icon(Icons.add),
        //     ),
        //   ),
        // ),
        backgroundColor: mainColor,
        endDrawer: MainDrawer(),
        appBar: AppBar(
          toolbarHeight: height * .15,
          shadowColor: secondaryColor.withOpacity(0.1),
          leading: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.arrow_back,
              color: mainColor,
            ),
          ),
          backgroundColor: mainColor,
          brightness: Brightness.dark,
          actions: [
            Padding(
              padding: EdgeInsets.only(left: 2, right: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    homeLogo,
                    width: width * .75,
                    height: height * .1,
                    color: lightGolden,
                    fit: BoxFit.fill,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          print("helo");
                          _scaffoldkey.currentState.openEndDrawer();
                        },
                        child: Icon(
                          Icons.menu,
                          color: lightGolden,
                          size: height * .04,
                        ),
                      ),
                      SizedBox(
                        width: width * .02,
                      ),
                      GestureDetector(
                          onTap: () {
                            AppRoutes.push(context, NotificationScreen());
                          },
                          child: Icon(
                            Icons.notifications,
                            size: width * .1,
                            color: lightGolden,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: lightGolden,
          itemOutlineColor: lightGolden,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: [
            CustomBottomNavigationBarItem(
              icon: Icons.visibility,
              title: "Watching",
            ),
            CustomBottomNavigationBarItem(
              icon: Icons.shopping_bag,
              title: "Purchase",
            ),
            CustomBottomNavigationBarItem(
              icon: FontAwesomeIcons.gavel,
              title: "Bid",
            ),
            CustomBottomNavigationBarItem(
              icon: Icons.person_outline_rounded,
              title: "Profile",
            ),
          ],
        ),
        body: _pageOptions[index]);
  }
}
