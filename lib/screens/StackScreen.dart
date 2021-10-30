import 'package:flutter/material.dart';

//screens
import '../widgets/ProductsScreen.dart';
import 'MenuScreen.dart';
//widgets
import '../widgets/appbar.dart';
import '../widgets/AppbarWidget.dart';

class StackScreen extends StatefulWidget {
  static String name = 'MainScreen';

  @override
  _StackScreenState createState() => _StackScreenState();
}

class _StackScreenState extends State<StackScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          MenuScreen(),
          ProductsScreen(),
          AppbarWidget(),
          AppbarButton(),
        ],
      ),
    );
  }
}
