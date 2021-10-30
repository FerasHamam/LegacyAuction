import 'package:ai_project/constants.dart';
import 'package:ai_project/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//widgets
import './ProductDateWidget.dart';
import './ProductDescWidget.dart';
import './ProductHighestBidderWidget.dart';

class ProductDetailsWidget extends StatelessWidget {
  final Product prod;

  ProductDetailsWidget({required this.prod});

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
      height: deviceSize.height * 0.4,
      width: deviceSize.width * 0.8,
      margin: EdgeInsets.only(top: 50.h),
      decoration: BoxDecoration(
          color: kPrimaryLightColor,
          borderRadius: BorderRadius.circular(120.sp),
          boxShadow: [
            BoxShadow(
                blurRadius: 0.2.sp, spreadRadius: 0.2.sp, color: Colors.black)
          ]),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        ProductDescWidget(desc: prod.desc),
        ProductHighestBiderWidget(
          highestBidder: prod.highestbidder,
          highestBid: prod.bidPrice,
        ),
        ProductDateWidget(postedin: prod.postedin, expiryDate: prod.expiryDate),
      ]),
    );
  }
}
