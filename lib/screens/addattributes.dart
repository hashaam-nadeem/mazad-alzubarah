import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zubara/API/basehelper.dart';
import 'package:zubara/languagedata/language_constants.dart';
import 'package:zubara/model/departmentAttributemodel.dart';
import 'package:zubara/model/singleton.dart';
import 'package:zubara/utils/Colors.dart';
import 'package:zubara/utils/const.dart';
import 'package:zubara/utils/routes.dart';
import 'package:zubara/utils/textstyle.dart';
import 'package:zubara/widgets/attributeWidget.dart';

class AddAttributes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddAttributes();
  }
}

class _AddAttributes extends State<AddAttributes> {
  var width, height;
  List<TextEditingController> controller = List<TextEditingController>();
  List<AttributeResult> attributeResult = List<AttributeResult>();
  @override
  void initState() {
    super.initState();
    APIHELPER()
        .allDepartmentAttributes(User.userData.departmentId, context)
        .then((value) {
      print(value);
      setState(() {
        attributeResult = value;
        User.userData.attributeResult = attributeResult;
      });
    }).catchError((error) {
      constValues().toast("${getTranslated(context, "wrong")}", context);
    });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        title: Text(
          "Add Attribute",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: width * .94,
                    height: height * .06,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(
                        top: 10, left: width * .03, right: width * .03),
                    decoration:
                        BoxDecoration(border: Border.all(color: lightGolden)),
                    child: Center(
                      child: Text(
                        "Inspection",
                        style: headingStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: width * .94,
                    height: height * .06,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(
                        top: 10, left: width * .03, right: width * .03),
                    decoration:
                        BoxDecoration(border: Border.all(color: lightGolden)),
                    child: Center(
                      child: Text(
                        "Location",
                        style: headingStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ))
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, int index) {
                  // print(attributeResult[index]
                  //     .attributeOptions
                  //     .option
                  //     .values);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        User.userData.attributeResult = attributeResult;
                      });
                      if (attributeResult.isEmpty) {
                        constValues().toast("no data found", context);
                      } else if (attributeResult[index]
                                  .attribute
                                  .name
                                  .toString() ==
                              'Specification' ||
                          attributeResult[index].attribute.name.toString() ==
                              'specification') {
                        print("specification");

                        AppRoutes.push(context, AttributeWidget(ind: index));
                      } else {
                        AppRoutes.push(context, AttributeWidget(ind: index));
                      }
                    },
                    child: Container(
                        width: width,
                        height: height * .06,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(
                            top: 10, left: width * .03, right: width * .03),
                        decoration: BoxDecoration(
                            border: Border.all(color: lightGolden)),
                        child: Center(
                          child: Text(
                            User.userData.lang != "en"
                                ? "${attributeResult[index].attribute.arabicName}"
                                : "${attributeResult[index].attribute.name}",
                            style: headingStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        )
                        // ExpansionTile(
                        //   title: Text(
                        //     User.userData.lang != "en"
                        //         ? "${attributeResult[index].attribute.arabicName}"
                        //         : "${attributeResult[index].attribute.name}",
                        //     style: headingStyle.copyWith(
                        //       fontSize: 16,
                        //     ),
                        //   ),
                        //   children: [
                        //     Container(
                        //       width: width,
                        //       height: height * .4,
                        //       child: ListView.builder(
                        //         itemBuilder: (context, int ind) {
                        //           return Container(
                        //             width: width,
                        //             margin: EdgeInsets.only(
                        //                 top: 10,
                        //                 bottom: 10,
                        //                 left: width * .03,
                        //                 right: width * .03),
                        //             decoration: BoxDecoration(
                        //                 color: mainColor,
                        //                 border: Border.all(color: lightGolden)),
                        //             padding: EdgeInsets.only(left: 10),
                        //             child: Row(
                        //               mainAxisAlignment:
                        //                   MainAxisAlignment.spaceBetween,
                        //               children: [
                        //                 Text(
                        //                   "${attributeResult[index].attributeOptions[4].option.values[ind]}",
                        //                   // User.userData.lang == "en"
                        //                   //     ? "${attributeResult[index].attributeOptions[ind].option.name}"
                        //                   //     : "${attributeResult[index].attributeOptions[ind].option.arabicName}",
                        //                   style: headingStyle.copyWith(
                        //                       fontSize: 16, color: Colors.white),
                        //                 ),
                        //                 Container(
                        //                   width: width * .35,
                        //                   height: height * .06,
                        //                   padding: EdgeInsets.only(left: 5),
                        //                   decoration: BoxDecoration(
                        //                       color: mainColor,
                        //                       border:
                        //                           Border.all(color: lightGolden)),
                        //                   child: TextField(
                        //                     style: headingStyle.copyWith(
                        //                         fontSize: 16,
                        //                         color: Colors.white),
                        //                     decoration: InputDecoration(
                        //                         border: InputBorder.none,
                        //                         hintStyle: headingStyle.copyWith(
                        //                             fontSize: 16,
                        //                             color: Colors.white),
                        //                         hintText: "enter value"),
                        //                   ),
                        //                 ),
                        //               ],
                        //             ),
                        //           );
                        //         },
                        //         itemCount: attributeResult[index]
                        //             .attributeOptions[4]
                        //             .option
                        //             .values
                        //             .length,
                        //       ),
                        //     ),
                        //   ],
                        // ),

                        ),
                  );
                },
                itemCount: attributeResult.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
