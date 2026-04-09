import 'package:flutter/material.dart';
import 'package:zubara/languagedata/language_constants.dart';
import 'package:zubara/model/singleton.dart';
import 'package:zubara/utils/Colors.dart';
import 'package:zubara/utils/const.dart';
import 'package:zubara/utils/routes.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:zubara/utils/textstyle.dart';

class RegistrationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  String title;
  BuildContext context;
  double height;
  bool pop;
  bool languagePage;
  RegistrationAppBar(
      {@required this.title,
      @required this.context,
      this.languagePage,
      this.pop,
      this.height});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClipPath(
        clipper: DiagonalPathClipperOne(),
        child: Container(
          padding: EdgeInsets.only(top: 30, left: 16, right: 16),
          width: MediaQuery.of(context).size.width,
          height: height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            lightGolden,
            lightGolden,
            secondaryColor,
            darkGolden
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height * .18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  pop == true
                      ? GestureDetector(
                          onTap: () {
                            AppRoutes.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ))
                      : Container(
                          width: height * .08,
                        ),
                  Text(
                    "$title",
                    style: headingStyle.copyWith(fontSize: height * .2),
                  ),
                  languagePage == true
                      ? GestureDetector(
                          onTap: () {
                            if (User.userData.lang == "en") {
                              User.userData.lang = "ar";
                              print(
                                  "Selected languages: ${User.userData.lang}");
                              constValues().changeLanguage("ar", context);
                            } else {
                              User.userData.lang = "en";
                              print(
                                  "Selected languages: ${User.userData.lang}");
                              constValues().changeLanguage("en", context);
                            }
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * .09,
                            width: MediaQuery.of(context).size.width * .13,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: secondaryColor, width: 2),
                                color: Colors.white),
                            child: Center(
                              child: Text(
                                "${getTranslated(context, "language")}",
                                textAlign: TextAlign.center,
                                style: headingStyle.copyWith(
                                    color: secondaryColor),
                              ),
                            ),
                          ),
                        )
                      : Container()
                ],
              ),
            ],
          ),
        ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}
