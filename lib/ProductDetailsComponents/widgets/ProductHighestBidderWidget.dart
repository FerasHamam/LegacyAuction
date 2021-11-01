import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//providers
import 'package:provider/provider.dart';
//models
import '../../models/Products.dart';

// ignore: must_be_immutable
class ProductHighestBiderWidget extends StatelessWidget {
  String highestBidder;
  String highestBid;
  String prodId;
  ProductHighestBiderWidget(
      {required this.highestBidder,
      required this.highestBid,
      required this.prodId});

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return StreamBuilder(
        stream: Provider.of<FirebaseProvider>(context, listen: false)
            .getDatabaseRef()
            .child(prodId)
            .onValue,
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return CircularProgressIndicator();
          if (snapshot.hasData) {
            final snap = snapshot.data.snapshot.value;
            highestBidder = snap['highestbidder'];
            highestBid = snap['bidPrice'];
          }
          return Container(
            alignment: Alignment.center,
            height: deviceSize.height * 0.1,
            padding: EdgeInsets.symmetric(horizontal: 80.sp),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Highest Bidder : $highestBidder',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 90.sp, color: Colors.grey[800]),
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.01,
                  ),
                  Text(
                    'Highest Bid : $highestBid\$',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 90.sp, color: Colors.grey[800]),
                  ),
                ]),
          );
        });
  }
}
