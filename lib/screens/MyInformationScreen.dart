import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
//constants
import '../constants.dart';
//widgets
import '../UserInformationComponents/EmailandNameWidget.dart';
//providers
import '../models/User.dart';

class MyInformationScreen extends StatefulWidget {
  static String name = "MyBidsScreen";
  @override
  _MyInformationScreenState createState() => _MyInformationScreenState();
}

class _MyInformationScreenState extends State<MyInformationScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Information',
          style: TextStyle(fontSize: 160.sp),
        ),
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 200.sp,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 200.sp),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Lottie.asset('lib/assets/lottie/Info.json', height: 300.h),
            EmailAndNameWidget(UserData.userName),
            EmailAndNameWidget(UserData.Email),
          ],
        ),
      ),
    );
  }
}
