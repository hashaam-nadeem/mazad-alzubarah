import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zubara/components/drawer.dart';
import 'package:zubara/screens/detail.dart';
import 'package:zubara/utils/Colors.dart';
import 'package:zubara/utils/detailscreenAppbar.dart';
import 'package:zubara/utils/routes.dart';
import 'package:zubara/utils/textstyle.dart';

class DepartmentCategory extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return category();
  }
}

class category extends State<DepartmentCategory> {
  var width, height;
  int style = 2;
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldkey,
      endDrawer: FilterDrawer(),
      backgroundColor: mainColor,
      appBar: DetailAppbar(
        title: "Cars",
        img: dummy,
        scaffoldkey: _scaffoldkey,
        detailPage: true,
        height: height * .2,
      ),
      body: Container(
        width: width,
        height: height,
        child: Column(
          children: [
            Row(
              children: [
                filters(1, "Price"),
                filters(2, "Lots"),
                filters(3, "Bids"),
                filters(4, "Date"),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (style == 2) {
                        style = 1;
                      } else {
                        style = 2;
                      }
                    });
                  },
                  child: Card(
                    color: darkBlue,
                    elevation: 10,
                    child: Container(
                      width: width * .12,
                      height: height * .04,
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: darkBlue),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                style == 1
                                    ? Icons.grid_view
                                    : Icons.list_alt_sharp,
                                size: height * .04,
                                color: lightGolden,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * .02,
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.all(2),
                      width: width,
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: style,
                          mainAxisSpacing: height * .02,
                          crossAxisSpacing: height * .01,
                          childAspectRatio: style == 1 ? 1.16 : 0.62,
                        ),
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              AppRoutes.push(context, ProductDetail());
                            },
                            child: Container(
                              width: width * .3,
                              // height: height * .15,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: lightGolden, width: 1),
                                  color: greyColor),
                              padding:
                                  EdgeInsets.only(left: 5, right: 5, top: 2),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: style == 1
                                            ? width * .95
                                            : width * .45,
                                        height: style == 1
                                            ? height * .24
                                            : height * .21,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: AssetImage(index.isEven
                                                    ? dummy2
                                                    : dummy),
                                                fit: BoxFit.fill)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * .01,
                                  ),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "Dodge Challenger",
                                          maxLines: 1,
                                          overflow: TextOverflow.clip,
                                          style: headingStyle.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              color: lightGolden),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * .01,
                                  ),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "Lot # 223225",
                                          maxLines: 1,
                                          overflow: TextOverflow.clip,
                                          style: headingStyle.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * .01,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            "images/bids.png",
                                            width: width * .07,
                                            fit: BoxFit.contain,
                                            color: Colors.white,
                                            height: height * .03,
                                          ),
                                          Text(
                                            "23",
                                            maxLines: 1,
                                            overflow: TextOverflow.clip,
                                            style: headingStyle.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.timelapse,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            "7h : 12m",
                                            maxLines: 1,
                                            overflow: TextOverflow.clip,
                                            style: headingStyle.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * .01,
                                  ),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "QAR 355.222",
                                          maxLines: 1,
                                          overflow: TextOverflow.clip,
                                          style: headingStyle.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: 10,
                      ),
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

  Widget filters(id, title) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(left: 5, right: 5, bottom: 10),
        padding: EdgeInsets.all(2),
        width: width * .18,
        height: height * .05,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: lightGolden, width: 1),
            color: mainColor),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Text(
                  "$title",
                  textAlign: TextAlign.center,
                  style: headingStyle.copyWith(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Icon(Icons.arrow_drop_down, color: Colors.white)
            ],
          ),
        ),
      ),
    );
  }
}
