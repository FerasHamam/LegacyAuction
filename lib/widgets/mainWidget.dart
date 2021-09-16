import 'package:flutter/material.dart';
//widgets
import '../widgets/appbar.dart';
import '../widgets/bottomCard.dart';

class MainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Appbar(),
        Align(alignment: Alignment.bottomCenter, child: BottomCard()),
      ],
    );
  }
}
