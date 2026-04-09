import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zubara/dashboard/mainscreen.dart';
import 'package:zubara/utils/Colors.dart';
import 'package:zubara/utils/routes.dart';
import 'package:zubara/utils/textstyle.dart';

class NotificationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NotificationScreen();
  }
}

class _NotificationScreen extends State<NotificationScreen> {
  var width, height;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      // appBar: AppBar(
      //   title: Text(
      //     "Notification",
      //     style: headingStyle,
      //   ),
      //   centerTitle: true,
      //   leading: GestureDetector(
      //     onTap: () {
      //       AppRoutes.pop(context);
      //     },
      //     child: Icon(
      //       Icons.arrow_back_ios,
      //       color: Colors.white,
      //     ),
      //   ),
      // ),
      body: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
            // border: Border.all(color: lightGolden, width: 2),
            color: mainColor,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    AppRoutes.pop(context);
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * .07,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.notifications,
                            color: lightGolden,
                            size: width * .1,
                          ),
                          SizedBox(
                            width: width * .06,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.arrow_drop_down_outlined,
                            size: height * .06,
                            color: lightGolden,
                          ),
                          SizedBox(
                            width: width * .06,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: height * .01,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, int index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: width,
                      // height: height * .2,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(
                          left: width * .03,
                          right: width * .03,
                          bottom: height * .02),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: mainColor),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "images/bids.png",
                                    width: width * .12,
                                    height: height * .04,
                                    color: Colors.white,
                                    fit: BoxFit.contain,
                                  ),
                                  Text(
                                    "Bid Closed",
                                    style: labelTextStyle.copyWith(
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              Text("1 March 2021",
                                  style: labelTextStyle.copyWith(
                                      color: Colors.white)),
                            ],
                          ),
                          SizedBox(
                            height: height * .02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Sorry if you have lost the item",
                                style: labelTextStyle.copyWith(
                                    color: lightGolden,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * .02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: width * .7,
                                height: 2,
                                color: lightGolden,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
