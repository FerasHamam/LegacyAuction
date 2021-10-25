import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
//models
import './models/AppState.dart';
import './models/User.dart';
//screens
import './screens/SignupScreen.dart';
import './screens/LoginScreen.dart';
import './screens/StackScreen.dart';
//firebase
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppState()),
        ChangeNotifierProvider(create: (context) => User())
      ],
      child: ScreenUtilInit(
        designSize: Size(2400, 1080),
        builder: () => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LoginScreen(),
          routes: {
            LoginScreen.name: (context) => LoginScreen(),
            SignupScreen.name: (context) => SignupScreen(),
            StackScreen.name: (context) => StackScreen()
          },
        ),
      ),
    );
  }
}
