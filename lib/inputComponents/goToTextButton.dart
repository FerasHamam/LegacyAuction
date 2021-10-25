import 'package:flutter/material.dart';
//constants
import '../constants.dart';
//screens
import '../screens/LoginScreen.dart';
import '../screens/SignupScreen.dart';

class goToTextButton extends StatelessWidget {
  final String text;
  goToTextButton({required this.text});
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: deviceSize.width * 0.8,
      child: goToSignup(deviceSize, text, context),
    );
  }
}

Widget goToSignup(Size deviceSize, String text, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        text == 'Signup instead'
            ? 'Don\'t have an account?'
            : 'Already have an account?',
        style:
            TextStyle(color: Colors.black, fontSize: deviceSize.height * 0.017),
      ),
      TextButton(
          onPressed: () {
            text == 'Signup instead'
                ? Navigator.of(context).pushNamed(SignupScreen.name)
                : Navigator.of(context).pushNamed(LoginScreen.name);
          },
          child: Text(
            text,
            style: TextStyle(
                color: kPrimaryColor, fontSize: deviceSize.height * 0.017),
          )),
    ],
  );
}
