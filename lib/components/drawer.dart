import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zubara/dashboard/mainscreen.dart';
import 'package:zubara/utils/Colors.dart';
import 'package:zubara/utils/textstyle.dart';

class FilterDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return filter();
  }
}

class filter extends State<FilterDrawer> {
  var width, height;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Container(
        width: width * .55,
        height: height,
        decoration: BoxDecoration(
            color: greyColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(height * .06),
                bottomLeft: Radius.circular(height * .06))),
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              width: width * .45,
              height: height * .08,
              decoration: BoxDecoration(
                  color: lightGolden, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  "Filter",
                  textAlign: TextAlign.center,
                  style: headingStyle,
                ),
              ),
            ),
            SizedBox(
              height: height * .1,
            ),
            filterList("Car Type", FontAwesomeIcons.car),
            filterList("Makers", FontAwesomeIcons.shieldAlt),
            filterList("Models", FontAwesomeIcons.carBattery),
            filterList("Years", FontAwesomeIcons.calendar),
            filterList("Price", FontAwesomeIcons.tag),
            filterList("Milage", FontAwesomeIcons.directions),
          ],
        ));
  }

  Widget filterList(title, IconData icon) {
    return Container(
      width: width * .45,
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: lightGolden,
                size: height * .03,
              ),
              SizedBox(
                width: width * .03,
              ),
              Text(
                "$title",
                style: headingStyle,
              )
            ],
          ),
          SizedBox(
            height: height * .02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width * .43,
                height: 3,
                color: lightGolden,
              ),
            ],
          )
        ],
      ),
    );
  }
}
