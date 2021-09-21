import 'package:flutter/material.dart';
//widgets
import '../widgets/bottomCard.dart' as BC;

class PageViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        children: [
          
          BC.BottomCard(),
        ],
      ),
    );
  }
}