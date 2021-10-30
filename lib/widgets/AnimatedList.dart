import 'package:ai_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//models
import '../models/Products.dart';
import '../models/Product.dart';
//widgets
import './ProductWidget.dart';

class ProductsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FirebaseAnimatedList(
        defaultChild: Container(
          child: Center(
            child: CircularProgressIndicator(
              color: kPrimaryColor,
              strokeWidth: 30.sp,
            ),
          ),
        ),
        padding: EdgeInsets.only(top: 1000.sp),
        query: Provider.of<Products>(context, listen: false).getDatabaseRef(),
        itemBuilder: (context, dataSnapShot, animation, index) {
          final json = dataSnapShot.value as Map<dynamic, dynamic>;
          final product = Product.fromJson(json);
          product.setProdId(dataSnapShot.key!);
          return ProductWidget(product);
        });
  }
}
