import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zubara/API/apimodel.dart';
import 'package:zubara/API/basehelper.dart';
import 'package:zubara/languagedata/language_constants.dart';
import 'package:zubara/model/departmentsmodel.dart';
import 'package:zubara/model/singleton.dart';
import 'package:zubara/screens/departmentCastegory.dart';
import 'package:zubara/screens/notification.dart';
import 'package:zubara/screens/singleproductDetail.dart';
import 'package:zubara/utils/Colors.dart';
import 'package:zubara/utils/Colors.dart';
import 'package:zubara/utils/routes.dart';
import 'package:zubara/utils/textstyle.dart';

class Watching extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _watching();
  }
}

class _watching extends State<Watching> {
  var width, height;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: mainColor,
        body: Container(
          padding: EdgeInsets.all(8),
          width: width,
          height: height,
          child: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Popular Auctions",
                                style: headingStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: width * .95,
                                height: height * .12,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, int index) {
                                    return GestureDetector(
                                      onTap: () {
                                        // AppRoutes.push(
                                        //     context, NotificationScreen());
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: width * .02,
                                            right: width * .02),
                                        width: width * .2,
                                        // height: height * .15,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: lightGolden, width: 2),
                                            color: mainColor,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  index.isEven ? story : story1,
                                                ),
                                                fit: BoxFit.contain)),
                                      ),
                                    );
                                  },
                                  itemCount: 10,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * .01,
                          ),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                        child: Column(
                      children: [
                        SizedBox(
                          height: height * .01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Auctions Selection",
                              style: headingStyle,
                            ),
                            // Row(
                            //   children: [
                            //     GestureDetector(
                            //       onTap: () {},
                            //       child: Text(
                            //         "See All",
                            //         style: headingStyle.copyWith(
                            //             fontSize: 14, height: 2),
                            //       ),
                            //     ),
                            //     SizedBox(
                            //       width: 4,
                            //     ),
                            //     Icon(
                            //       Icons.arrow_forward_ios,
                            //       size: height * .02,
                            //       color: Colors.white,
                            //     )
                            //   ],
                            // ),
                          ],
                        ),
                      ],
                    )),
                    SliverToBoxAdapter(
                      child: FutureBuilder<List<AllDepartmentResult>>(
                        future: APIHELPER().getAllDepartments(context),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return snapshot.data.length == 0
                                ? Center(
                                    child: Image.asset(
                                      noResult,
                                      width: width,
                                      height: height * .5,
                                      fit: BoxFit.fill,
                                    ),
                                  )
                                : Container(
                                    width: width,
                                    child: GridView.builder(
                                      shrinkWrap: true,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisSpacing: height * .02,
                                        crossAxisSpacing: height * .02,
                                        childAspectRatio: 1,
                                      ),
                                      physics: BouncingScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            AppRoutes.push(
                                                context, DepartmentCategory());
                                          },
                                          child: Container(
                                            width: width * .3,
                                            // height: height * .15,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: lightGolden,
                                                    width: 2),
                                                color: mainColor),
                                            padding: EdgeInsets.all(5),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    snapshot.data[index]
                                                                .images !=
                                                            null
                                                        ? Image.network(
                                                            "${API.API_URL}${snapshot.data[index].images.normal}",
                                                            width: width * .2,
                                                            height:
                                                                height * .07,
                                                            fit: BoxFit.fill,
                                                          )
                                                        : Image.asset(
                                                            logoImage,
                                                            width: width * .2,
                                                            height:
                                                                height * .06,
                                                            fit: BoxFit.fill,
                                                          ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: height * .01,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        User.userData.lang !=
                                                                "en"
                                                            ? "${snapshot.data[index].arabicName}"
                                                            : "${snapshot.data[index].name}",
                                                        maxLines: 1,
                                                        textAlign:
                                                            TextAlign.center,
                                                        overflow:
                                                            TextOverflow.clip,
                                                        style: headingStyle
                                                            .copyWith(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color:
                                                                    lightGolden),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: snapshot.data.length,
                                    ),
                                  );
                          } else {
                            return Container(
                              width: width,
                              height: height * .15,
                              child: Center(
                                  child: CupertinoActivityIndicator(
                                radius: height * .06,
                                iOSVersionStyle:
                                    CupertinoActivityIndicatorIOSVersionStyle
                                        .iOS14,
                              )),
                            );
                          }
                        },
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: height * .01,
                      ),
                    ),
                    // SliverToBoxAdapter(
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Text(
                    //         "Classified/ Direct Purchase",
                    //         style: headingStyle,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SliverToBoxAdapter(
                    //   child: SizedBox(
                    //     height: height * .01,
                    //   ),
                    // ),
                    // SliverToBoxAdapter(
                    //   child: Container(
                    //     width: width,
                    //     child: GridView.builder(
                    //       shrinkWrap: true,
                    //       gridDelegate:
                    //           SliverGridDelegateWithFixedCrossAxisCount(
                    //         crossAxisCount: 3,
                    //         mainAxisSpacing: height * .02,
                    //         crossAxisSpacing: height * .02,
                    //         childAspectRatio: 1,
                    //       ),
                    //       physics: BouncingScrollPhysics(),
                    //       itemBuilder: (context, index) {
                    //         return GestureDetector(
                    //           onTap: () {
                    //             AppRoutes.push(context, SingleProductDetail());
                    //           },
                    //           child: Container(
                    //             width: width * .3,
                    //             // height: height * .15,
                    //             decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(10),
                    //                 border: Border.all(
                    //                     color: lightGolden, width: 2),
                    //                 color: mainColor),
                    //             padding: EdgeInsets.all(5),
                    //             child: Column(
                    //               mainAxisAlignment: MainAxisAlignment.center,
                    //               children: [
                    //                 Row(
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.center,
                    //                   children: [
                    //                     Image.asset(
                    //                       index.isEven
                    //                           ? classified
                    //                           : classified1,
                    //                       width: width * .2,
                    //                       height: height * .06,
                    //                       fit: BoxFit.fill,
                    //                     ),
                    //                   ],
                    //                 ),
                    //                 SizedBox(
                    //                   height: height * .01,
                    //                 ),
                    //                 Row(
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.center,
                    //                   children: [
                    //                     Flexible(
                    //                       child: Text(
                    //                         index.isEven ? "Camera" : "Games",
                    //                         maxLines: 1,
                    //                         overflow: TextOverflow.clip,
                    //                         style: headingStyle.copyWith(
                    //                             fontSize: 14,
                    //                             fontWeight: FontWeight.normal,
                    //                             color: lightGolden),
                    //                       ),
                    //                     )
                    //                   ],
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         );
                    //       },
                    //       itemCount: 4,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
