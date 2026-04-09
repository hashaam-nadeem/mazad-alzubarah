import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zubara/dashboard/mainscreen.dart';
import 'package:zubara/screens/cart.dart';
import 'package:zubara/utils/Colors.dart';
import 'package:zubara/utils/customButton.dart';
import 'package:zubara/utils/routes.dart';
import 'package:zubara/utils/textstyle.dart';

class SingleProductDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return detail();
  }
}

class detail extends State<SingleProductDetail> {
  var width, height;
  int value = 10;
  List<String> specification = [
    "Inspect Report",
    "Options",
    "Detail Specification",
    "inpection Location Map",
    "Chat with Us",
    "Terms and Condition"
  ];
  List<String> images = [
    dummy,
    dummy2,
    cartImg,
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        title: Text(
          "Detail",
          style: headingStyle,
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            AppRoutes.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              AppRoutes.push(context, Cart());
            },
            child: Icon(
              Icons.shopping_cart,
              color: Colors.white,
              size: height * .04,
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Container(
        width: width,
        height: height,
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                shrinkWrap: true,
                slivers: [
                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: width,
                          height: height * .3,
                          child: Swiper(
                            containerHeight: height * .3,
                            containerWidth: width,
                            curve: Curves.decelerate,
                            layout: SwiperLayout.DEFAULT,
                            viewportFraction: 1.0,
                            outer: false,
                            itemHeight: height * .3,
                            itemWidth: width,
                            itemBuilder: (BuildContext context, int index) {
                              return Image.asset(
                                images[index],
                                fit: BoxFit.fill,
                              );
                              //  Image.network(
                              //   "http://via.placeholder.com/350x150",
                              //   fit: BoxFit.fill,
                              // );
                            },
                            itemCount: images.length,
                            pagination: new SwiperPagination(),
                            control: new SwiperControl(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: height * .02,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: width * .06, right: width * .06),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Current Price",
                                      style: headingStyle.copyWith(
                                          color: greyColor, fontSize: 18),
                                    ),
                                    Text(
                                      "QAR 355,222",
                                      style:
                                          headingStyle.copyWith(fontSize: 16),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Minimum Increment",
                                      style: headingStyle.copyWith(
                                          color: greyColor, fontSize: 16),
                                    ),
                                    Text(
                                      "QAR 5000",
                                      style:
                                          headingStyle.copyWith(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * .02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: width * .85,
                                  height: 3,
                                  color: greyColor,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * .02,
                            ),
                            lotDetail("Lot Number: ", "5432",
                                Icons.looks_one_outlined),
                            lotDetail("Ending Time: ", "1 March 2021",
                                Icons.alarm_on),
                            lotDetail("Remaining Time: ", "3 hours and 30 min",
                                Icons.watch_later),
                            SizedBox(
                              height: height * .02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: width * .8,
                                  height: height * .06,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: greyColor),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              decrement();
                                            },
                                            child: Container(
                                              width: width * .15,
                                              height: height * .06,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    bottomLeft:
                                                        Radius.circular(10),
                                                  ),
                                                  color: lightGolden),
                                              child: Center(
                                                  child: Icon(Icons.remove,
                                                      color: Colors.white)),
                                            ),
                                          ),
                                          Text(
                                            "$value",
                                            style: headingStyle.copyWith(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              increment();
                                            },
                                            child: Container(
                                              width: width * .15,
                                              height: height * .06,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10),
                                                  ),
                                                  color: lightGolden),
                                              child: Center(
                                                  child: Icon(Icons.add,
                                                      color: Colors.white)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: height * .02,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Details",
                                  style: headingStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * .02,
                            ),
                            modalDetail("Make", "Dodge"),
                            modalDetail("Model", "Challenger"),
                            modalDetail("Year", "2020"),
                            modalDetail("KMS Driven", "47,000 km"),
                            modalDetail("Fuel", "Petrol"),
                            modalDetail("Condition", "Used"),
                            modalDetail("Registered in", "Doha, Qatar"),
                          ],
                        )),
                  ),
                  // SliverList(
                  //   delegate: SliverChildBuilderDelegate((context, int index) {
                  //     return specificationList(index);
                  //   }, childCount: specification.length),
                  // ),

                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _showDialog(context);
                            // AppRoutes.push(context, LoginScreen());
                          },
                          child: CustomButton(
                            width: width * .7,
                            height: height * .06,
                            color: lightGolden,
                            title: "Add To Cart",
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: height * .02,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget lotDetail(title, value, IconData icon) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Icon(
            icon,
            size: height * .04,
            color: lightGolden,
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            "$title",
            style: headingStyle.copyWith(fontSize: 16),
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            "$value",
            style: headingStyle.copyWith(
                fontSize: 16, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }

// ignore: missing_return
  Widget modalDetail(title, value) {
    return Container(
      color: greyColor,
      margin: EdgeInsets.only(bottom: height * .02),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$title",
            style: headingStyle.copyWith(
                fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            "$value",
            style: headingStyle.copyWith(
                fontSize: 16, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }

  Widget specificationList(index) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: height * .02, left: width * .06, right: width * .06),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${specification[index]}",
                style: headingStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: height * .04,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 8),
                width: width * .85,
                height: 3,
                color: greyColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void increment() {
    setState(() {
      value = value + 10;
    });
  }

  void decrement() {
    if (value > 10) {
      setState(() {
        value = value - 10;
      });
    }
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
                              color: mainColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: lightGolden, width: 2)),
                          padding: EdgeInsets.only(left: 12, right: 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                      "Your Bid has been place Successfully",
                                      overflow: TextOverflow.clip,
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      style: headingStyle.copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      AppRoutes.pop(context);
                                    },
                                    child: Container(
                                      width: width * .5,
                                      height: height * .06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: lightGolden),
                                      child: Center(
                                        child: Text(
                                          "OK",
                                          overflow: TextOverflow.clip,
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          style: headingStyle.copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ))),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width * .2,
                      height: MediaQuery.of(context).size.height * .1,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: lightGolden),
                      child: Center(
                        child: Icon(
                          Icons.done,
                          color: mainColor,
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
