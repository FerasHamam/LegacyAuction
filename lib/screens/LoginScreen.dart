import 'package:flutter/material.dart';
//providers
import 'package:provider/provider.dart';
import '../models/User.dart';
//constants
import 'package:ai_project/constants.dart';
//input helpers
import '../inputComponents/inputField.dart';
import 'package:ai_project/inputComponents/button.dart';
import '../inputComponents/goToTextButton.dart';

class LoginScreen extends StatefulWidget {
  static String name = 'loginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: deviceSize.height * 0.2,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 40),
                child: Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: deviceSize.height * 0.07,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              InputField(
                  hintText: 'Email',
                  icon: Icons.people,
                  onChanged: (email) =>
                      {Provider.of<User>(context, listen: false).email = email},
                  obsecure: false),
              InputField(
                  hintText: 'Password',
                  icon: Icons.lock,
                  onChanged: (password) => {
                        Provider.of<User>(context, listen: false).password =
                            password
                      },
                  obsecure: true),
              RoundedButton(
                onSubmit: () =>
                    Provider.of<User>(context, listen: false).login(),
                text: 'Login',
              ),
              goToTextButton(text: 'Signup instead'),
            ],
          ),
        ),
      ),
    );
  }
}
