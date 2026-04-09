import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zubara/dashboard/mainscreen.dart';
import 'package:zubara/utils/Colors.dart';
import 'package:zubara/utils/detailscreenAppbar.dart';
import 'package:zubara/utils/textstyle.dart';

class Purchase extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _watching();
  }
}

class _watching extends State<Purchase> {
  var width, height;
  bool direct = false;
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
        backgroundColor: mainColor,
        // appBar: DetailAppbar(
        //   title: "Purchase",
        //   img: purchase,
        //   scaffoldkey: _scaffoldkey,
        //   detailPage: true,
        //   height: height * .2,
        // ),
        body: Container(
          width: width,
          height: height,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        direct = false;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: width * .1),
                      width: width * .33,
                      height: height * .06,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: direct == false ? lightGolden : mainColor),
                      child: Center(
                        child: Text(
                          "Auctions",
                          style: headingStyle.copyWith(
                              color:
                                  direct == false ? Colors.white : lightGolden),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        direct = true;
                      });
                    },
                    child: Container(
                      width: width * .3,
                      height: height * .06,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: direct == true ? lightGolden : mainColor),
                      child: Center(
                        child: Text(
                          "Direct Sale",
                          style: headingStyle.copyWith(
                              color:
                                  direct == true ? Colors.white : lightGolden),
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
                child: ListView.builder(
                  itemBuilder: (context, int index) {
                    return purchaseList(index);
                  },
                  itemCount: 5,
                ),
              ),
            ],
          ),
        ));
  }

  Widget purchaseList(int index) {
    return Container(
      margin: EdgeInsets.only(
          left: width * .03, right: width * .03, bottom: height * .02),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: mainColor,
          border: Border.all(color: lightGolden, width: 2)),
      child: Row(
        children: [
          Container(
            width: width * .3,
            margin: EdgeInsets.only(right: 5),
            height: height * .15,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(index.isEven ? dummy : dummy2),
                    fit: BoxFit.fill)),
          ),
          Expanded(
            child: Container(
              height: height * .15,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          "lamborgani avetendor",
                          maxLines: 1,
                          style: headingStyle.copyWith(
                              color: Colors.white, fontSize: 13),
                        ),
                      ),
                      Icon(
                        Icons.close,
                        color: lightGolden,
                        size: height * .02,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          "Doha,Qatar",
                          maxLines: 1,
                          style: headingStyle.copyWith(
                              color: Colors.white, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "images/bids.png",
                            width: width * .08,
                            height: height * .04,
                            color: Colors.white,
                            fit: BoxFit.fill,
                          ),
                          Text(
                            " :23",
                            maxLines: 1,
                            style: headingStyle.copyWith(
                                color: Colors.white, fontSize: 13),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.timelapse,
                            size: height * .03,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            "2h 34 mins",
                            maxLines: 1,
                            style: headingStyle.copyWith(
                                color: Colors.white, fontSize: 13),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          "Won with BID QAR 200,000",
                          maxLines: 1,
                          style: headingStyle.copyWith(
                              color: Colors.white, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
