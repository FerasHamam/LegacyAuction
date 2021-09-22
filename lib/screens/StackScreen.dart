import 'package:flutter/material.dart';
//screens
import 'CategoriesScreen.dart';
import 'MenuScreen.dart';
//widgets
import '../widgets/appbar.dart';

class StackScreen extends StatefulWidget {
  const StackScreen({Key? key}) : super(key: key);

  @override
  _StackScreenState createState() => _StackScreenState();
}

class _StackScreenState extends State<StackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [MenuScreen(), CategoriesScreen(), Appbar()],
      ),
    );
  }
}
