import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//constants
import '../constants.dart';

class ProductHighestBiderWidget extends StatelessWidget {
  final String highestBidder;
  final String highestBid;
  ProductHighestBiderWidget(
      {required this.highestBidder, required this.highestBid});

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
      height: deviceSize.height * 0.1,
      padding: EdgeInsets.all(40.sp),
      child: Column(children: [
        Text(
          'Highest Bidder : $highestBidder',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 120.sp, color: Colors.grey[800]),
        ),
        Text(
          'Highest Bid : $highestBid',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 120.sp, color: Colors.grey[800]),
        ),
      ]),
    );
  }
}
