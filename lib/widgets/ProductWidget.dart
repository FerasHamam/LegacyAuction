import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Column(children: [
      Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: deviceSize.width * 0.7,
            height: deviceSize.height * 0.15,
            margin: EdgeInsets.all(100.sp),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(300.sp),
                topRight: Radius.circular(150.sp),
                bottomLeft: Radius.circular(150.sp),
                bottomRight: Radius.circular(150.sp),
              ),
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                height: 10.h,
              ),
              Text(
                '${prod.name.toUpperCase()}',
                style: TextStyle(
                    color: kPrimaryLightColor,
                    fontSize: 200.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                '${prod.startingPrice}\$',
                style: TextStyle(
                    color: kPrimaryLightColor,
                    fontSize: 150.sp,
                    fontWeight: FontWeight.bold),
              ),
            ]),
          ),
          Container(
            width: deviceSize.width * 0.7,
            height: deviceSize.height * 0.05,
            margin: EdgeInsets.only(
                top: 700.sp, left: 150.sp, right: 150.sp, bottom: 150.sp),
            decoration: BoxDecoration(
              color: kPrimaryLightColor,
            ),
            child: Center(
              child: Text(
                '${prod.expiryDate.difference(prod.postedin).inDays} Days left',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 150.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ),
            ),
          )
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
    ]);
  }
}
// {prod.expiryDate.day}-${prod.expiryDate.month}-${prod.expiryDate.year}