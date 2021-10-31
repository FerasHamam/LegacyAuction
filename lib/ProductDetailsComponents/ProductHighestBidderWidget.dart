import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductHighestBiderWidget extends StatelessWidget {
  final String highestBidder;
  final String highestBid;
  ProductHighestBiderWidget(
      {required this.highestBidder, required this.highestBid});

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      height: deviceSize.height * 0.1,
      padding: EdgeInsets.symmetric(horizontal: 80.sp),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Highest Bidder : $highestBidder',
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 120.sp, color: Colors.grey[800]),
        ),
        Text(
          'Highest Bid : $highestBid',
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 120.sp, color: Colors.grey[800]),
        ),
      ]),
    );
  }
}
