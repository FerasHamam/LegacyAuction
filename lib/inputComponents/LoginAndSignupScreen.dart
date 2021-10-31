import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
//provider
import 'package:provider/provider.dart';
import '../models/User.dart';
import '../models/AppState.dart';
//constants
import 'package:ai_project/constants.dart';
//input helpers
import 'widgets/InputContainer.dart';
import 'widgets/goToTextButton.dart';
//screens
import '../MainAndMenuComponents/screens/StackScreen.dart';

class LoginAndSignupScreen extends StatefulWidget {
  static String name = 'mix';
  @override
  _LoginAndSignupScreenState createState() => _LoginAndSignupScreenState();
}

class _LoginAndSignupScreenState extends State<LoginAndSignupScreen>
    with TickerProviderStateMixin {
  late TextEditingController email;
  late TextEditingController name;
  late TextEditingController password;
  late AnimationController _controller;
  final _formKey = GlobalKey<FormState>();
  bool isValid = false;

  @override
  void initState() {
    email = TextEditingController();
    name = TextEditingController();
    password = TextEditingController();
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String type = Provider.of<AppState>(context).type;
    Size deviceSize = MediaQuery.of(context).size;
    final userData = Provider.of<UserData>(context);
    return Scaffold(
      body: Stack(children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 200),
          child: Form(
            key: _formKey,
            child: Container(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: deviceSize.height * 0.1,
                    ),
                    Lottie.asset('lib/assets/lottie/Login.json',
                        height: 250.h,
                        controller: _controller, onLoaded: (composition) {
                      _controller
                        ..duration = composition.duration
                        ..forward();
                    }),
                    SizedBox(
                      height: deviceSize.height * 0.1,
                    ),
                    if (type == "Signup")
                      inputContainer(
                        child: TextFormField(
                          controller: name,
                          textInputAction: TextInputAction.next,
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
                            if (value.length < 3) {
                              return 'Name should be at least 3 characters long!';
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
                        textInputAction: TextInputAction.next,
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
                            isValid = true;

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
                        textInputAction: TextInputAction.done,
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

                          isValid = true;

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
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      width: deviceSize.width * 0.8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(29),
                        child: ElevatedButton(
                          child: Text(
                            type,
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            isValid = _formKey.currentState!.validate();
                            print(isValid);
                            if (isValid) {
                              _formKey.currentState!.save();
                              try {
                                bool validUser;
                                if (type == 'Signup')
                                  validUser = await Provider.of<UserData>(
                                          context,
                                          listen: false)
                                      .signup(
                                          name: name.text,
                                          email: email.text,
                                          password: password.text);
                                else
                                  validUser = await Provider.of<UserData>(
                                          context,
                                          listen: false)
                                      .login(
                                          email: email.text,
                                          password: password.text);

                                if (validUser)
                                  Navigator.of(context)
                                      .pushReplacementNamed(StackScreen.name);
                              } catch (err) {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                    err as String,
                                    textAlign: TextAlign.center,
                                  ),
                                  backgroundColor: Colors.red,
                                ));
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              primary: kPrimaryColor,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 20),
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ),
                    goToTextButton(
                        text: type == 'Login'
                            ? 'Signup instead'
                            : 'Login instead'),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (userData.isLoggingIn)
          Container(
            width: double.infinity,
            height: deviceSize.height,
            color: Colors.black38,
          ),
        if (userData.isLoggingIn)
          Center(
            child: CircularProgressIndicator(
              color: kPrimaryColor,
              backgroundColor: Colors.black38,
              strokeWidth: 5,
            ),
          ),
      ]),
    );
  }
}
