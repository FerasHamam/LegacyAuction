import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
//widgets
import '../widgets/mainWidget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    // Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        color: Colors.white,
        child: 
        LiquidSwipe(
          pages: [MainWidget(), MainWidget()],
          waveType: WaveType.circularReveal,
          enableSideReveal: true,
        ),
      ),
    );
  }
}
