import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//constants
import '../constants.dart';

class ProductDescWidget extends StatelessWidget {
  final String desc;
  ProductDescWidget({required this.desc});

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Column(
      children: [
        SingleChildScrollView(
          child: Container(
            height: deviceSize.height * 0.2,
            padding: EdgeInsets.all(40.sp),
            child: Text(
              desc,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 120.sp, color: Colors.grey[800]),
            ),
          ),
        ),
        Container(
          width: deviceSize.width * 0.2,
          child: Divider(
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
