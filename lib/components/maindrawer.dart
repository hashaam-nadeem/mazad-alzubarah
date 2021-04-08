import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zubara/screens/cart.dart';
import 'package:zubara/utils/Colors.dart';
import 'package:zubara/utils/customButton.dart';
import 'package:zubara/utils/routes.dart';
import 'package:zubara/utils/textstyle.dart';

class MainDrawer extends StatefulWidget {
  bool filter;
  MainDrawer({this.filter});
  @override
  _BuyerDrawerState createState() => _BuyerDrawerState();
}

class _BuyerDrawerState extends State<MainDrawer> {
  bool physical = false;
  bool virtual = false, all = false, location = false;
  double radius = 0.0;
  var width, height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Container(
      width: MediaQuery.of(context).size.width * .7,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(width * .4),
          ),
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).primaryColor,
                blurRadius: 2,
                spreadRadius: 0.3),
          ]),
      padding: EdgeInsets.only(left: 10, bottom: 10),
      child: ListView(
        children: [
          SizedBox(
            height: height * .1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: width * .03),
                width: width * .63,
                height: height * .1,
                color: Colors.white,
                child: Center(
                  child: Row(
                    children: [
                      Container(
                        width: width * .2,
                        height: height * .08,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: lightGolden, width: 3),
                            image: DecorationImage(
                                image: AssetImage("images/dummyProfile.jpg"),
                                fit: BoxFit.fill)),
                      ),
                      Flexible(
                        child: Text(
                          "Ali Haider",
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: headingStyle.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: mainColor),
                        ),
                      )
                    ],
                  ),
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
              Text(
                "Make a deposti & start bidding",
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                style: headingStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  // AppRoutes.push(context, LoginScreen());
                },
                child: CustomButton(
                  width: width * .35,
                  height: height * .06,
                  color: lightGolden,
                  title: "Deposit Now",
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * .04,
          ),
          tile(1, "View Cart", cart),
          tile(2, "chat", chat),
          tile(3, "Contact Us", contactUs),
          tile(4, "About Us", aboutUs),
          tile(5, "Share", share),
          tile(6, "FAQ / Help", faq),
          tile(7, "Socail Responsibility", socialResponsibility),
          tile(8, "Terms & Condition", condition),
          SizedBox(
            height: height * .04,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "\tLogOut",
                style: headingStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                width: width * .03,
              ),
              Icon(
                Icons.logout,
                size: height * .03,
                color: lightGolden,
              ),
              SizedBox(
                width: width * .03,
              ),
            ],
          ),
          SizedBox(
            height: height * .01,
          ),
        ],
      ),
    );
  }

  Widget tile(int id, title, icon) {
    return GestureDetector(
        onTap: () {
          if (id == 1) {
            AppRoutes.push(context, Cart());
          }
        },
        child: Padding(
          padding: EdgeInsets.only(bottom: height * .02),
          child: Row(
            children: [
              Image.asset(
                "$icon",
                width: width * .1,
                height: height * .04,
                color: lightGolden,
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: width * .03,
              ),
              Text(
                "$title",
                style: headingStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ));
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        child: AlertDialog(
          backgroundColor: Colors.transparent,
          // shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.all(Radius.circular(15.0))),
          contentPadding: EdgeInsets.only(top: 10.0),
          content: Container(
              width: MediaQuery.of(context).size.width * .7,
              height: MediaQuery.of(context).size.height * .3,
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          width: MediaQuery.of(context).size.width * .7,
                          height: MediaQuery.of(context).size.height * .25,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          padding: EdgeInsets.only(left: 12, right: 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      AppRoutes.pop(context);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(top: 10),
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey.withOpacity(0.2)),
                                      child: Center(
                                        child: Text(
                                          "Cancel",
                                          textAlign: TextAlign.center,
                                          //   maxLines: 1,
                                          overflow: TextOverflow.clip,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      //  AppRoutes.push(context, Languages());
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(top: 10),
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color:
                                              Theme.of(context).primaryColor),
                                      child: Center(
                                        child: Text(
                                          "Login",
                                          textAlign: TextAlign.center,
                                          //   maxLines: 1,
                                          overflow: TextOverflow.clip,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ))),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width * .2,
                      height: MediaQuery.of(context).size.height * .1,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).primaryColor),
                      child: Center(
                        child: Icon(
                          FontAwesomeIcons.userLock,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }
}
