import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
//models
// import '../models/AppState.dart';

class BottomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.bottomCenter,
      height: deviceSize.height * 0.45,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(450.sp),
          topRight: Radius.circular(450.sp),
        ),
      ),
    );
  }
}
