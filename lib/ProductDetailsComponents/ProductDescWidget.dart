import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//constants
class ProductDescWidget extends StatelessWidget {
  final String desc;
  ProductDescWidget({required this.desc});

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
      height: desc.length > 50
          ? deviceSize.height * 0.18
          : deviceSize.height * 0.15,
      child: Column(
        children: [
          SingleChildScrollView(
            child: Container(
              height: desc.length > 50
                  ? deviceSize.height * 0.16
                  : deviceSize.height * 0.12,
              padding: EdgeInsets.all(80.sp),
              child: Text(
                desc,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 110.sp, color: Colors.grey[800]),
              ),
            ),
          ),
          Container(
            height: deviceSize.height * 0.01,
            width: deviceSize.width * 0.2,
            child: Divider(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
