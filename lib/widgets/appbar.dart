import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Appbar extends StatefulWidget {
  @override
  _AppbarState createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> with TickerProviderStateMixin {
  late AnimationController _animController1;
  bool isPlaying1 = false;
  @override
  void initState() {
    _animController1 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 120));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    double notchSize = MediaQuery.of(context).viewPadding.top;
    return Container(
        alignment: Alignment.topCenter,
        color: Colors.white,
        height: deviceSize.height * 0.1,
        width: deviceSize.width,
        margin: EdgeInsets.only(top: notchSize),
        child: IconButton(
          padding: EdgeInsets.only(left: 1900.w, top: 20.h),
          icon: AnimatedIcon(
            icon: AnimatedIcons.menu_home,
            progress: _animController1,
            color: Colors.black,
            size: 250.sp,
          ),
          onPressed: () {
            setState(() {
              isPlaying1 = !isPlaying1;
              isPlaying1
                  ? _animController1.forward()
                  : _animController1.reverse();
            });
          },
        ));
  }
}
