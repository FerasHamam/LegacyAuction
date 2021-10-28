import 'package:flutter/material.dart';
//provider
import 'package:provider/provider.dart';
import '../models/User.dart';
//constants
import 'package:ai_project/constants.dart';
//input helpers
import '../inputComponents/InputContainer.dart';
import 'package:ai_project/inputComponents/button.dart';
import '../inputComponents/goToTextButton.dart';

class SignupScreen extends StatefulWidget {
  static String name = 'signup';
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
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
                    'Signup',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: deviceSize.height * 0.07,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                inputContainer(
                  child: TextFormField(
                    controller: name,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onSaved: (value) {
                      if (value == null) {
                        value = "";
                      }
                      name.text = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        value = "";
                      }
                      if (value.length < 5) {
                        return 'Name should be at least 5 characters long!';
                      }
                      return null;
                    },
                    cursorColor: kPrimaryColor,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.text_fields_rounded,
                          color: kPrimaryColor,
                        ),
                        hintText: 'Enter Your Name',
                        border: InputBorder.none),
                  ),
                ),
                inputContainer(
                  child: TextFormField(
                    controller: email,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onSaved: (value) {
                      if (value == null) {
                        value = "";
                      }
                      email.text = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        value = "";
                      }
                      final pattern =
                          r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
                      final regExp = RegExp(pattern);
                      if (value.isEmpty) {
                        return 'Enter an email';
                      } else if (!regExp.hasMatch(value)) {
                        return 'Enter a valid email';
                      } else {
                        return null;
                      }
                    },
                    cursorColor: kPrimaryColor,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.email_rounded,
                          color: kPrimaryColor,
                        ),
                        hintText: 'Enter Your Email',
                        border: InputBorder.none),
                  ),
                ),
                inputContainer(
                  child: TextFormField(
                    controller: password,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onSaved: (value) {
                      if (value == null) {
                        value = "";
                      }
                      password.text = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        value = "";
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long!';
                      }
                      return null;
                    },
                    cursorColor: kPrimaryColor,
                    obscureText: true,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.password_rounded,
                          color: kPrimaryColor,
                        ),
                        hintText: 'Enter Your Password',
                        border: InputBorder.none),
                  ),
                ),
                RoundedButton(
                  text: 'Signup',
                  onSubmit: () {
                    bool isValid = _formKey.currentState!.validate();
                    if (isValid) {
                      _formKey.currentState!.save();
                    }
                    return Provider.of<User>(context, listen: false).signup(
                        name: name.text,
                        email: email.text,
                        passowrd: password.text);
                  },
                ),
                goToTextButton(text: 'Login instead'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
