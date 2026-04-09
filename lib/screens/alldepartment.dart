import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zubara/API/basehelper.dart';
import 'package:zubara/model/departmentsmodel.dart';
import 'package:zubara/model/singleton.dart';
import 'package:zubara/screens/addattributes.dart';
import 'package:zubara/utils/Colors.dart';
import 'package:zubara/utils/routes.dart';
import 'package:zubara/utils/textstyle.dart';

class AddDepartment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddDepartment();
  }
}

class _AddDepartment extends State<AddDepartment> {
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
          "All Departments",
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
          child: FutureBuilder<List<AllDepartmentResult>>(
              future: APIHELPER().getAllDepartments(context),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemBuilder: (context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            User.userData.departmentId =
                                snapshot.data[index].id;
                            User.userData.addProduct =
                                List<Map<dynamic, dynamic>>();
                          });

                          print(
                              "department id : ${User.userData.departmentId}");
                          print(User.userData.lang);
                          AppRoutes.push(context, AddAttributes());
                        },
                        child: Container(
                            width: width,
                            margin: EdgeInsets.only(
                                top: 10, left: width * .04, right: width * .03),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: lightGolden),
                                color: mainColor),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Text(
                                  User.userData.lang != "en"
                                      ? "${snapshot.data[index].arabicName}"
                                      : "${snapshot.data[index].name}",
                                  style: headingStyle.copyWith(
                                      fontSize: height * .02,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            )),
                      );
                    },
                    itemCount: snapshot.data.length,
                  );
                } else {
                  return Center(
                    child: CupertinoActivityIndicator(),
                  );
                }
              })),
    );
  }
}
