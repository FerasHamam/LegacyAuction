import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
//providers
import 'package:provider/provider.dart';
import '../models/AppState.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
//screens

import 'AddProductScreen.dart';
import './MyBidsScreen.dart';
import './LoginAndSignupScreen.dart';
//constants
import '../constants.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
      color: kPrimaryColor,
      width: double.infinity,
      padding: EdgeInsets.only(
          left: deviceSize.width * 0.05, top: deviceSize.height * 0.08),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 300.h,
          ),
          TextButton.icon(
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent)),
            onPressed: () {
              Navigator.of(context).pushNamed(AddProductScreen.name);
            },
            icon: Icon(
              Icons.add_circle_outline,
              color: Colors.white,
              size: 180.sp,
            ),
            label: Text(
              "Add Product",
              style: TextStyle(color: Colors.white, fontSize: 170.sp),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          TextButton.icon(
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent)),
              onPressed: () {
                Navigator.of(context).pushNamed(MyBidsScreen.name);
              },
              icon: Icon(
                Icons.person_rounded,
                color: Colors.white,
                size: 180.sp,
              ),
              label: Text(
                "My Bids",
                style: TextStyle(color: Colors.white, fontSize: 170.sp),
              )),
          SizedBox(
            height: 20.h,
          ),
          TextButton.icon(
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent)),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Provider.of<AppState>(context, listen: false).setMenu();
                Navigator.of(context)
                    .pushReplacementNamed(LoginAndSignupScreen.name);
              },
              icon: Icon(
                Icons.logout_rounded,
                color: Colors.white,
                size: 180.sp,
              ),
              label: Text(
                "Logout",
                style: TextStyle(color: Colors.white, fontSize: 170.sp),
              )),
        ],
      ),
    );
  }
}
