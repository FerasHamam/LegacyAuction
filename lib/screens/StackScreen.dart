import 'package:flutter/material.dart';
//screens
import 'ProductsScreen.dart';
import 'MenuScreen.dart';
//widgets
import '../widgets/appbar.dart';

class StackScreen extends StatefulWidget {
  static String name = 'MainScreen';

  @override
  _StackScreenState createState() => _StackScreenState();
}

class _StackScreenState extends State<StackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [MenuScreen(), ProductsScreen(), Appbar()],
      ),
    );
  }
}
