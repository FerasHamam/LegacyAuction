import 'package:flutter/material.dart';
//constants
import '../constants.dart';

class MyBidsScreen extends StatefulWidget {
  static String name = "MyBidsScreen";
  @override
  _MyBidsScreenState createState() => _MyBidsScreenState();
}

class _MyBidsScreenState extends State<MyBidsScreen> {
  @override
  Widget build(BuildContext context) {
    // Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Bids'),
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}
