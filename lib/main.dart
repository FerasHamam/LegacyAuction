import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
//models
import './models/AppState.dart';
import './models/User.dart';
import './models/Products.dart';
//screens
import 'MainAndMenuComponents/screens/StackScreen.dart';
import './AddProductComponents/AddProductScreen.dart';
import 'UserInformationComponents/MyInformationScreen.dart';
import 'inputComponents/LoginAndSignupScreen.dart';
//firebase
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
        ChangeNotifierProvider(create: (context) => UserData()),
        ChangeNotifierProvider(create: (context) => FirebaseProvider()),
      ],
      child: ScreenUtilInit(
        designSize: Size(2200, 1080),
        builder: () => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: _getLandingPage(context),
          routes: {
            LoginAndSignupScreen.name: (context) => LoginAndSignupScreen(),
            StackScreen.name: (context) => StackScreen(),
            AddProductScreen.name: (context) => AddProductScreen(),
            MyInformationScreen.name: (context) => MyInformationScreen(),
          },
        ),
      ),
    );
  }
}

Widget _getLandingPage(BuildContext context) {
  if (FirebaseAuth.instance.currentUser == null) {
    return LoginAndSignupScreen();
  }
  if (UserData.userName.length < 1)
    UserData.setUserName().then(
      (value) {
        UserData.setEmail(FirebaseAuth.instance.currentUser!.email!);
        return StackScreen();
      },
    );
  return StackScreen();
}
