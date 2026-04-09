import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zubara/model/singleton.dart';
import 'package:zubara/utils/Colors.dart';
import 'package:zubara/utils/customButton.dart';
import 'package:zubara/utils/customTextfield.dart';
import 'package:zubara/utils/routes.dart';
import 'package:zubara/utils/textstyle.dart';

class AttributeWidget extends StatefulWidget {
  int ind;
  AttributeWidget({this.ind});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AttributeWidget();
  }
}

class _AttributeWidget extends State<AttributeWidget> {
  var width, height;
  int controllerLenght = 0;
  List<String> controllerValues = List<String>();
  List<String> controllerName = List<String>();
  List<TextEditingController> controller = List<TextEditingController>();
  List<String> dropdownValues = List<String>();
  List<Map<String, dynamic>> map = List<Map<String, dynamic>>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.ind);
    print(
        "option lenght: ${User.userData.attributeResult[widget.ind].attributeOptions.length}");
    for (int i = 0;
        i < User.userData.attributeResult[widget.ind].attributeOptions.length;
        i++) {
      setState(() {
        controllerLenght = controllerLenght + 1;
        controllerValues.add(null);
        controllerName.add(User.userData.attributeResult[widget.ind]
            .attributeOptions[i].option.name);
      });
      // if (User.userData.attributeResult[widget.ind].attributeOptions[i].option
      //         .type ==
      //     0) {
      //   dropdownValues.add(User.userData.attributeResult[widget.ind]
      //       .attributeOptions[i].option.values
      //       .toString());

      //   setState(() {
      //     controllerLenght = controllerLenght + 1;
      //     controllerValues.add(null);
      //     controllerName.add(User.userData.attributeResult[widget.ind]
      //         .attributeOptions[i].option.name);
      //   });
      //   // controllerValues.add()
      //   // controller.lenght = controller.lenght + 1;
      //   ;
      // } else if (User.userData.attributeResult[widget.ind].attributeOptions[i]
      //         .option.type ==
      //     1) {
      //   setState(() {
      //     controllerLenght = controllerLenght + 1;
      //   });
      //   // controllerValues.add()
      //   controller.add(User.userData.attributeResult[widget.ind]
      //       .attributeOptions[i].option.name
      //       .toString() as TextEditingController);
      // } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    print("dropdown values: $dropdownValues");
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () {
          print(controllerValues);
          map.clear();
          for (int i = 0; i < controllerValues.length; i++) {
            setState(() {
              map.add({controllerName[i]: controllerValues[i]});
            });
          }
          print(User.userData.addProduct.contains(
              User.userData.attributeResult[widget.ind].attribute.name));
          if (User.userData.addProduct.contains(
              User.userData.attributeResult[widget.ind].attribute.name)) {
            setState(() {
              User.userData.addProduct.removeLast();
            });
          } else {
            if (User.userData.addProduct.isNotEmpty) {
              setState(() {
                User.userData.addProduct.removeLast();
                User.userData.addProduct.add({
                  User.userData.attributeResult[widget.ind].attribute.name: map
                });
              });
            } else {
              setState(() {
                User.userData.addProduct.add({
                  User.userData.attributeResult[widget.ind].attribute.name: map
                });
              });
            }
          }

          print("map data: ${User.userData.addProduct}");
        },
        child: CustomButton(
          width: width * .6,
          height: height * .06,
          color: lightGolden,
          title: "Save",
        ),
      ),
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
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate:
                          SliverChildBuilderDelegate((context, int index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: height * .02),
                              width: width * .85,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width * .01),
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * .03,
                                  right:
                                      MediaQuery.of(context).size.width * .02),
                              child: TextField(
                                // controller: widget.controller,
                                // keyboardType: widget.keyboardTypenumeric == true
                                //     ? TextInputType.number
                                //     : TextInputType.text,
                                // maxLength: widget.number == true ? 8 : 40,
                                style: labelTextStyle.copyWith(
                                    color: secondaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    counterText: "",
                                    labelText: "${controllerName[index]}",
                                    labelStyle: labelTextStyle.copyWith(
                                        color: secondaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal)),
                                onChanged: (value) {
                                  controllerValues[index] = value;
                                },
                              ),
                            )
                          ],
                        );
                      }, childCount: controllerValues.length),
                    ),

                    // SliverList(
                    //   delegate:
                    //       SliverChildBuilderDelegate((context, int index) {
                    //     return dropdownValues[index].isEmpty
                    //         ? Container()
                    //         : Row(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               Container(
                    //                 width: double.infinity,
                    //                 margin: EdgeInsets.only(bottom: 10),
                    //                 height: 40,
                    //                 child: DropdownButton(
                    //                   isExpanded: true,
                    //                   icon: Container(
                    //                     alignment: Alignment.centerRight,
                    //                     child: Icon(Icons.arrow_drop_down),
                    //                   ),
                    //                   hint: Text(
                    //                       'Please choose a Catagory'), // Not necessary for Option 1
                    //                   value: dropdownValues[index].toString(),
                    //                   onChanged: (newValue) {
                    //                     setState(() {
                    //                       dropdownValues[index] = newValue;
                    //                     });
                    //                   },
                    //                   items: dropdownValues.map((catagory) {
                    //                     return DropdownMenuItem(
                    //                       child: new Text(catagory),
                    //                       value: catagory,
                    //                     );
                    //                   }).toList(),
                    //                 ),
                    //               ),
                    //             ],
                    //           );
                    //   }, childCount: dropdownValues.length),
                    // ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
