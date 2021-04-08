import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zubara/utils/Colors.dart';
import 'package:zubara/utils/textstyle.dart';

class ProfileTextField extends StatefulWidget {
  var width, height, title;
  TextEditingController controller = TextEditingController();
  ProfileTextField(
      {@required this.height, this.controller, this.title, this.width});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return custom();
  }
}

class custom extends State<ProfileTextField> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
          width: widget.width,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(MediaQuery.of(context).size.width * .06),
            color: mainColor,
          ),
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .03,
              right: MediaQuery.of(context).size.width * .02),
          child: TextField(
            controller: widget.controller,
            style: labelTextStyle.copyWith(
                color: secondaryColor,
                fontSize: 14,
                fontWeight: FontWeight.normal),
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "${widget.title}",
                labelStyle: labelTextStyle.copyWith(
                    color: secondaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.normal)),
          ),
        ),
        Container(
          width: widget.title == "Address"
              ? MediaQuery.of(context).size.width * .7
              : MediaQuery.of(context).size.width * .8,
          height: 2,
          color: Colors.white,
        ),
      ],
    );
  }
}
