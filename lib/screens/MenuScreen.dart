import "package:flutter/material.dart";
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
//screens
import './LoginScreen.dart';
//constants
import '../constants.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
          left: deviceSize.width * 0.05, top: deviceSize.height * 0.08),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton.icon(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacementNamed(LoginScreen.name);
              },
              icon: Icon(
                Icons.logout_rounded,
                color: kPrimaryColor,
                size: deviceSize.height * 0.04,
              ),
              label: Text(
                "Logout",
                style: TextStyle(
                    color: kPrimaryColor, fontSize: deviceSize.height * 0.04),
              )),
        ],
      ),
    );
  }
}
