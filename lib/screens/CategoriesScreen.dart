import 'package:flutter/material.dart';
//widgets
import '../widgets/appbar.dart';
import '../widgets//bottomCard.dart' as BC;

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    // Size deviceSize = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.topCenter,
      color: Colors.white,
      child: Column(
        children: [
          Appbar(),
          BC.BottomCard(),
        ],
      ),
    );
  }
}
