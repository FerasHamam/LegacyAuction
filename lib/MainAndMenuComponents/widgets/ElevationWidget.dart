import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//providers
import 'package:provider/provider.dart';
import '../../models/AppState.dart';
//constants
import '../../constants.dart';

class ElevationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: Duration(milliseconds: 50),
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 300.sp),
      width: deviceSize.width,
      height: Provider.of<AppState>(context).isMenu ? 0 : 125.h,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        boxShadow:
            Provider.of<AppState>(context).isMenu ? [] : kElevationToShadow[4],
      ),
    );
  }
}
