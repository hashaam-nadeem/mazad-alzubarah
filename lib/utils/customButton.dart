import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zubara/utils/Colors.dart';
import 'package:zubara/utils/textstyle.dart';

class CustomButton extends StatefulWidget {
  var width, height, title;
  Color color;
  CustomButton({@required this.color, this.height, this.title, this.width});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return custom();
  }
}

class custom extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      color: widget.color,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.width * .02),
      ),
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(MediaQuery.of(context).size.width * .02),
            color: widget.color,
            border: Border.all(color: mainColor)),
        child: Center(
          child: Text(
            "${widget.title}",
            style: headingStyle.copyWith(fontWeight: FontWeight.w300),
          ),
        ),
      ),
    );
  }
}
