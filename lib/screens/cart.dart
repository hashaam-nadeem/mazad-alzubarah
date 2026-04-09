import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zubara/components/map.dart';
import 'package:zubara/utils/Colors.dart';
import 'package:zubara/utils/customButton.dart';
import 'package:zubara/utils/routes.dart';
import 'package:zubara/utils/textstyle.dart';

class Cart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Cart();
  }
}

class _Cart extends State<Cart> {
  var width, height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        title: Text(
          "Cart",
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
      ),
      body: Container(
        width: width,
        height: height,
        child: Column(
          children: [
            SizedBox(
              height: height * .02,
            ),
            SizedBox(
              height: height * .03,
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, int index) {
                      return cartList(index);
                    }, childCount: 5),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: width * .06, right: width * .06),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Delivery Charges: ",
                                style: headingStyle.copyWith(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: width * .08,
                              ),
                              Text(
                                "QAR 2300 ",
                                style: headingStyle.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * .02,
                          ),
                          Row(
                            children: [
                              Text(
                                "Total Amount: ",
                                style: headingStyle.copyWith(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: width * .08,
                              ),
                              Text(
                                "QAR 2300 ",
                                style: headingStyle.copyWith(
                                  fontSize: 16,
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
                              Text("Delivery Addresses: ", style: headingStyle),
                              GestureDetector(
                                onTap: () {
                                  AppRoutes.push(context, AreaNeeded());
                                },
                                child: Text("+ Add Address",
                                    style: headingStyle.copyWith(
                                        fontSize: 18, color: greyColor)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * .02,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, int index) {
                      return addressList();
                    }, childCount: 2),
                  ),
                  SliverToBoxAdapter(
                      child: Column(
                    children: [
                      SizedBox(
                        height: height * .02,
                      ),
                      Container(
                        width: width,
                        height: 3,
                        color: Colors.white,
                      ),
                    ],
                  )),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * .02,
                        ),
                        Row(
                          children: [
                            Text("Payment Method: ", style: headingStyle),
                          ],
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          // male = true;
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(right: 10),
                                            width: width * .06,
                                            height: height * .04,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: lightGolden,
                                                    width: 2)),
                                          ),
                                          Text(
                                            "Credit Card",
                                            style: headingStyle.copyWith(
                                                fontSize: 16),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * .1,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          // male = false;
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(right: 10),
                                            width: width * .06,
                                            height: height * .04,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: lightGolden,
                                                    width: 2)),
                                          ),
                                          Text(
                                            "Cash on Delivery",
                                            style: headingStyle.copyWith(
                                                fontSize: 16),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: width,
                                height: height * .1,
                                color: Colors.black,
                                child: Center(
                                  child: CustomButton(
                                    width: width * .8,
                                    height: height * .06,
                                    color: lightGolden,
                                    title: "Proceed",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                      ],
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

  Widget cartList(int index) {
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
                          index.isEven ? "Play Station" : "Samsung s5",
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
                  SizedBox(
                    height: height * .07,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          "QAR 2300",
                          maxLines: 1,
                          style: headingStyle.copyWith(
                              color: Colors.white, fontSize: 13),
                        ),
                      ),
                      Container(
                        width: width * .3,
                        height: height * .05,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: lightGolden, width: 2),
                            color: mainColor),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: width * .08,
                                    height: height * .042,
                                    color: lightGolden,
                                    child: Center(
                                      child: Icon(
                                        Icons.remove,
                                        color: mainColor,
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: width * .08,
                                    height: height * .042,
                                    color: lightGolden,
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        color: mainColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
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

  Widget addressList() {
    return GestureDetector(
        onTap: () {},
        child: Container(
          width: width,
          margin: EdgeInsets.only(
              bottom: height * .02, left: width * .06, right: width * .06),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: mainColor,
              border: Border.all(color: lightGolden, width: 2)),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text("Unname Road, Lusaim Qatar: ",
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        style: headingStyle.copyWith(fontSize: 16)),
                  ),
                  Container(
                    width: width * .08,
                    height: height * .04,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: mainColor,
                        border: Border.all(color: lightGolden)),
                    child: Center(
                      child: Icon(
                        Icons.done,
                        color: lightGolden,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * .02,
              ),
              Row(
                children: [
                  Flexible(
                    child: Text("BuildingNo: 34, Street:34, Zone: 4 ",
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        style: headingStyle.copyWith(
                            fontSize: 14, color: lightGolden)),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
