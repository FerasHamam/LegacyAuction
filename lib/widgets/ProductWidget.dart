import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//screens
import '../screens//ProductDetailsScreen.dart';
//constants
import '../constants.dart';
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
                  )),
        );
      },
      child: Column(children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              width: deviceSize.width * 0.8,
              height: deviceSize.height * 0.3,
              margin: EdgeInsets.only(top: 200.sp, bottom: 100.sp),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150.sp),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 10.sp,
                        blurRadius: 10.sp,
                        color: kPrimaryLightColor),
                  ]),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  '${prod.name.toUpperCase()}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 160.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  '${prod.bidPrice}\$',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 130.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.h,
                ),
              ]),
            ),
            Container(
              width: deviceSize.width * 0.8,
              height: deviceSize.height * 0.2,
              margin: EdgeInsets.all(200.sp),
              decoration: BoxDecoration(
                image: new DecorationImage(
                    image: NetworkImage(prod.imageURL), fit: BoxFit.fill),
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(150.sp),
                  topRight: Radius.circular(150.sp),
                  bottomLeft: Radius.circular(150.sp),
                  bottomRight: Radius.circular(150.sp),
                ),
              ),
            ),
            Container(
              width: deviceSize.width * 0.7,
              height: deviceSize.height * 0.05,
              margin: EdgeInsets.only(
                  top: 250.sp, left: 150.sp, right: 150.sp, bottom: 150.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70.sp),
                color: Colors.black54,
              ),
              child: Center(
                child: Text(
                  '${prod.expiryDate.difference(prod.postedin).inDays} Days left',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 150.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 850.w),
          child: Divider(
            color: kPrimaryColor,
            thickness: 5.sp,
            height: 20.sp,
          ),
        ),
      ]),
    );
  }
}
