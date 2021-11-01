import 'package:flutter/material.dart';
//constants
import '../../constants.dart';
//screens
//provider
import 'package:provider/provider.dart';
import '../../models/AppState.dart';

class goToTextButton extends StatelessWidget {
  final String text;
  goToTextButton({required this.text});
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: deviceSize.width * 0.8,
      child: goTo(deviceSize, text, context),
    );
  }
}

Widget goTo(Size deviceSize, String text, BuildContext context) {
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
            if (text == 'Signup instead') {
              // Navigator.of(context).pushNamed(SignupScreen.name);
              Provider.of<AppState>(context, listen: false).setType();
            } else {
              // Navigator.of(context).pushNamed(LoginScreen.name);
              Provider.of<AppState>(context, listen: false).setType();
            }
          },
          child: Text(
            text,
            style: TextStyle(
                color: kPrimaryColor, fontSize: deviceSize.height * 0.017),
          )),
    ],
  );
}
