import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ProductDateWidget extends StatelessWidget {
  final DateTime postedin;
  final DateTime expiryDate;
  final String email;
  ProductDateWidget(
      {required this.postedin, required this.expiryDate, required this.email});

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(right: 40.sp, left: 40.sp, bottom: 30.sp),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 40.sp),
            alignment: Alignment.center,
            height: deviceSize.height * 0.01,
            width: deviceSize.width * 0.2,
            child: Divider(
              color: Colors.grey[600],
            ),
          ),
          Text(
            '${expiryDate.difference(DateTime.now()).inDays} days left!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 80.sp, color: Colors.grey[600]),
          ),
          Text(
            'Posted in ${DateFormat('dd - MM - yyyy').format(postedin)} by ${email}',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 80.sp, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
