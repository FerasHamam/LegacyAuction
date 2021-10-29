import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
//modles
import '../models/AppState.dart';
//widgets
import '../widgets/AnimatedList.dart';

class ProductsScreen extends StatelessWidget {
  static String name = 'productsscreen';
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    bool isMenu = Provider.of<AppState>(context).getIsMenu();
    double scale = isMenu ? 0.6 : 1.0;
    double slideX = isMenu ? deviceSize.width * 1.1 : 0;
    double slideY = isMenu ? deviceSize.height * 0.6 : 0;
    return Align(
      alignment: Alignment.bottomRight,
      child: AnimatedContainer(
        transform: Matrix4.identity()
          ..scale(scale)
          ..translate(slideX, slideY),
        duration: Duration(milliseconds: 100),
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.w),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black, blurRadius: 2.w, spreadRadius: 0.2.w),
            ]),
        child: ProductsList(),
      ),
    );
  }
}
