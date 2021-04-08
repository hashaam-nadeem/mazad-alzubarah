import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zubara/utils/Colors.dart';
import 'package:zubara/utils/textstyle.dart';

class CustomTextField extends StatefulWidget {
  var width, height, title;
  bool keyboardTypenumeric;
  TextEditingController controller = TextEditingController();
  CustomTextField(
      {@required this.height,
      @required this.keyboardTypenumeric,
      this.controller,
      this.title,
      this.width});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return custom();
  }
}

class custom extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.width * .06),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * .03,
          right: MediaQuery.of(context).size.width * .02),
      child: TextField(
        controller: widget.controller,
        keyboardType: widget.keyboardTypenumeric == true
            ? TextInputType.number
            : TextInputType.text,
        style: labelTextStyle.copyWith(
            color: secondaryColor, fontSize: 14, fontWeight: FontWeight.normal),
        decoration: InputDecoration(
            border: InputBorder.none,
            labelText: "${widget.title}",
            labelStyle: labelTextStyle.copyWith(
                color: secondaryColor,
                fontSize: 14,
                fontWeight: FontWeight.normal)),
      ),
    );
  }
}
