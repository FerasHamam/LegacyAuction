import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ProductDateWidget extends StatelessWidget {
  final DateTime postedin;
  final DateTime expiryDate;
  ProductDateWidget({required this.postedin, required this.expiryDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40.sp),
      child: Column(
        children: [
          Text(
            '${expiryDate.difference(postedin).inDays} days left!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 120.sp, color: Colors.grey[600]),
          ),
          Text(
            'Posted in ${DateFormat('dd - MM - yyyy').format(postedin)}',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 120.sp, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
