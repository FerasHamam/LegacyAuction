import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//constants
import '../constants.dart';

class EmailAndNameWidget extends StatelessWidget {
  final String text;
  EmailAndNameWidget(this.text);
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return emailContainer(text, deviceSize);
  }
}

Widget emailContainer(String text, Size deviceSize) {
  return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(100.sp),
      padding: EdgeInsets.all(10.sp),
      width: text.length > 25 ? deviceSize.width * 0.9 : deviceSize.width * 0.8,
      height: text.length > 25
          ? deviceSize.height * 0.09
          : deviceSize.height * 0.08,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              spreadRadius: 3.sp, blurRadius: 10.sp, color: kPrimaryLightColor),
        ],
        borderRadius: BorderRadius.circular(200.sp),
      ),
      child: Text(
        text.contains('@') == true ? 'Email : $text' : 'Username : ${text}',
        softWrap: true,
        overflow: TextOverflow.visible,
        style: TextStyle(
          fontSize: text.contains('@') == true ? 85.sp : 90.sp,
          fontWeight: FontWeight.bold,
          color: kPrimaryColor,
        ),
      ));
}
