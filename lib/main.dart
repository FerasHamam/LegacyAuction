import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//screens
import './screens/StackScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(2400, 1080),
      builder: () => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StackScreen(),
      ),
    );
  }
}
