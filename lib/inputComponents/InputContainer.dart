import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class inputContainer extends StatelessWidget {
  final Widget child;
  const inputContainer({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 60.sp),
      padding: EdgeInsets.symmetric(horizontal: 45.sp, vertical: 15.sp),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: kPrimaryLightColor,
          borderRadius: BorderRadius.circular(29),
          boxShadow: [
            BoxShadow(
                blurRadius: 0.1.sp, spreadRadius: 0.2.sp, color: Colors.black)
          ]),
      child: child,
    );
  }
}
