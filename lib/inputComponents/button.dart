import 'package:flutter/material.dart';
//constants
import '../constants.dart';
//screens
import '../screens/StackScreen.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function onSubmit;
  final Color color, textColor;
  const RoundedButton({
    required this.text,
    required this.onSubmit,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
        margin: EdgeInsets.only(top: 40),
        width: deviceSize.width * 0.8,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(29),
          child: newElevatedButton(context),
        ),
      ),
    ]);
  }

  Widget newElevatedButton(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      onPressed: () async {
        bool success = await this.onSubmit();
        if (success)
          Navigator.of(context).pushReplacementNamed(StackScreen.name);
        else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Check your email and password!"),
            backgroundColor: Colors.red,
          ));
        }
      },
      style: ElevatedButton.styleFrom(
          primary: color,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          textStyle: TextStyle(
              color: textColor, fontSize: 18, fontWeight: FontWeight.w500)),
    );
  }
}
