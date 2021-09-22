import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
//models
import '../models/AppState.dart';

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
    return Align(
      alignment: Alignment.topRight,
      child: Container(
          alignment: Alignment.topCenter,
          color: Colors.transparent,
          height: deviceSize.height * 0.1,
          width: deviceSize.width * 0.5,
          margin: EdgeInsets.only(top: notchSize),
          child: IconButton(
            padding: EdgeInsets.only(left: 600.w, top: 20.h),
            icon: AnimatedIcon(
              icon: AnimatedIcons.menu_home,
              progress: _animController1,
              color: Colors.black,
              size: 250.sp,
            ),
            onPressed: () {
              setState(() {
                isPlaying1 = !isPlaying1;
                if (isPlaying1) {
                  _animController1.forward();
                  Provider.of<AppState>(context, listen: false).setMenu();
                } else {
                  _animController1.reverse();
                  Provider.of<AppState>(context, listen: false).setMenu();
                }
              });
            },
          )),
    );
  }
}
