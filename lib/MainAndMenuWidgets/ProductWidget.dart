import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//screens
import '../screens//ProductDetailsScreen.dart';
//constants
//models
import '../models/Product.dart';

class ProductWidget extends StatelessWidget {
  final Product prod;
  ProductWidget(this.prod);
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
              prod: prod,
            ),
          ),
        );
      },
      child: Column(children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: deviceSize.width * 0.85,
              height: deviceSize.height * 0.25,
              margin: EdgeInsets.all(100.sp),
              decoration: BoxDecoration(
                image: new DecorationImage(
                    image: NetworkImage(prod.imageURL), fit: BoxFit.cover),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(150.sp),
                  topRight: Radius.circular(150.sp),
                ),
              ),
            ),
            Container(
              width: deviceSize.width * 0.85,
              height: deviceSize.height * 0.05,
              margin: EdgeInsets.only(
                  top: 100.sp, left: 150.sp, right: 150.sp, bottom: 150.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(150.sp),
                color: Colors.black54,
              ),
              child: Center(
                child: Text(
                  '${prod.expiryDate.difference(DateTime.now()).inDays} Days left',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 130.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              width: deviceSize.width * 0.85,
              height: deviceSize.height * 0.08,
              margin: EdgeInsets.only(top: 260.h, bottom: 100.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(150.sp),
                    bottomRight: Radius.circular(150.sp)),
                color: Colors.black54,
              ),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  '${prod.name.toUpperCase()}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 140.sp,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '${prod.bidPrice}\$',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 120.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.h,
                ),
              ]),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 850.w),
          child: Divider(
            color: Colors.black,
            thickness: 5.sp,
            height: 20.sp,
          ),
        ),
      ]),
    );
  }
}
