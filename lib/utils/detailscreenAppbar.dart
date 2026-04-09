import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zubara/utils/Colors.dart';
import 'package:zubara/utils/routes.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:zubara/utils/textstyle.dart';

class DetailAppbar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  double height;
  String img;
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  bool detailPage;
  DetailAppbar(
      {@required this.title,
      this.img,
      @required this.scaffoldkey,
      this.detailPage,
      this.height});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: 30, left: 16, right: 16),
      width: MediaQuery.of(context).size.width,
      height: height,
      decoration: BoxDecoration(color: mainColor),
      child: Column(
        //  mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: height * .18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    AppRoutes.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  )),
              detailPage == true
                  ? Column(
                      children: [
                        Image.asset(
                          img,
                          width: MediaQuery.of(context).size.width * .3,
                          height: MediaQuery.of(context).size.height * .06,
                          fit: BoxFit.fill,
                        ),
                        Text(
                          "$title",
                          style: headingStyle.copyWith(fontSize: height * .2),
                        ),
                      ],
                    )
                  : Text(
                      "$title",
                      style: headingStyle.copyWith(fontSize: height * .2),
                    ),
              detailPage == true
                  ? Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.search,
                            size: 30,
                            color: lightGolden,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            print("hello");
                            //Scaffold.of(context).openEndDrawer();
                            scaffoldkey.currentState.openEndDrawer();
                          },
                          child: Icon(
                            FontAwesomeIcons.filter,
                            size: 20,
                            color: lightGolden,
                          ),
                        ),
                      ],
                    )
                  : Container()
            ],
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}
