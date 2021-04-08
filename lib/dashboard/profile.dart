import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zubara/components/map.dart';
import 'package:zubara/screens/setPassword.dart';
import 'package:zubara/utils/Colors.dart';
import 'package:zubara/utils/customButton.dart';
import 'package:zubara/utils/customTextfield.dart';
import 'package:zubara/utils/profileTextfield.dart';
import 'package:zubara/utils/routes.dart';
import 'package:zubara/utils/textstyle.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _watching();
  }
}

class _watching extends State<Profile> {
  var width, height;
  bool male = true;
  bool updatePassword = false;
  bool document = false;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
        backgroundColor: mainColor,
        body: Container(
          padding: EdgeInsets.only(left: width * .09, right: width * .09),
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Container(
                        width: width * .3,
                        height: height * .15,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.all(color: lightGolden, width: 2),
                            image: DecorationImage(
                                image: AssetImage("images/dummyProfile.jpg"),
                                fit: BoxFit.fill)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: height * .04,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: height * .03,
                ),
                ProfileTextField(
                  width: width * .85,
                  title: "First Name",
                  height: height * 08,
                ),
                ProfileTextField(
                  width: width * .85,
                  title: "Last Name",
                  height: height * 08,
                ),
                ProfileTextField(
                  width: width * .85,
                  title: "Age",
                  height: height * 08,
                ),
                SizedBox(
                  height: height * .02,
                ),
                Row(
                  children: [
                    Text(
                      "Gender",
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
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          male = true;
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
                                color:
                                    male == true ? lightGolden : Colors.white,
                                border:
                                    Border.all(color: lightGolden, width: 2)),
                          ),
                          Text(
                            "Male",
                            style: headingStyle.copyWith(fontSize: 16),
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
                          male = false;
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
                                color:
                                    male == false ? lightGolden : Colors.white,
                                border:
                                    Border.all(color: lightGolden, width: 2)),
                          ),
                          Text(
                            "Female",
                            style: headingStyle.copyWith(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                ProfileTextField(
                  width: width * .85,
                  title: "Commission preferences",
                  height: height * 08,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProfileTextField(
                      width: width * .72,
                      title: "Address",
                      height: height * 08,
                    ),
                    GestureDetector(
                        onTap: () {
                          AppRoutes.push(context, AreaNeeded());
                        },
                        child: Icon(
                          Icons.my_location,
                          color: lightGolden,
                          size: height * .04,
                        )),
                  ],
                ),
                SizedBox(
                  height: height * .03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "My Documents",
                      style: headingStyle,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          document = !document;
                        });
                      },
                      child: Icon(
                        document == true
                            ? Icons.keyboard_arrow_down_outlined
                            : Icons.arrow_forward_ios,
                        color: lightGolden,
                        size: height * .04,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: width * .8,
                      height: 3,
                      color: Colors.white,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * .03,
                ),
                document == true ? documentsNeeded() : Container(),
                ProfileTextField(
                  width: width * .85,
                  title: "traffic File Number",
                  height: height * 08,
                ),
                SizedBox(
                  height: height * .03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // AppRoutes.push(context, SetPassword());
                      },
                      child: CustomButton(
                        width: width * .6,
                        height: height * .08,
                        color: lightGolden,
                        title: "Update Profile",
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: height * .03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Change Password",
                      style: headingStyle,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          updatePassword = !updatePassword;
                        });
                      },
                      child: Icon(
                        updatePassword == true
                            ? Icons.keyboard_arrow_down_outlined
                            : Icons.arrow_forward_ios,
                        color: lightGolden,
                        size: height * .04,
                      ),
                    ),
                  ],
                ),
                updatePassword == true ? changePassword() : Container(),
                SizedBox(
                  height: height * .02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: width * .8,
                      height: 3,
                      color: Colors.white,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * .03,
                ),
              ],
            ),
          ),
        ));
  }

  Widget documentsNeeded() {
    return Column(
      children: [
        documents("Emirate ID"),
        documents("Qatar Visa Page"),
        documents("Passport"),
        documents("Driver Licence"),
      ],
    );
  }

  Widget changePassword() {
    return Column(
      children: [
        ProfileTextField(
          width: width * .85,
          title: "Password",
          height: height * 08,
        ),
        ProfileTextField(
          width: width * .85,
          title: "Confirm Password",
          height: height * 08,
        ),
        SizedBox(
          height: height * .02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                // AppRoutes.push(context, SetPassword());
              },
              child: CustomButton(
                width: width * .6,
                height: height * .08,
                color: lightGolden,
                title: "Update Password",
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget documents(title) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: height * .02),
            width: width * .8,
            height: height * .09,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: mainColor,
              border: Border.all(color: lightGolden, width: 2),
            ),
            padding: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$title",
                      style: headingStyle.copyWith(fontSize: 14),
                    ),
                    Icon(
                      Icons.add_circle_outline_rounded,
                      color: lightGolden,
                      size: height * .04,
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Missing",
                      style:
                          headingStyle.copyWith(fontSize: 14, color: greyColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
