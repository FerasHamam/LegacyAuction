import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
//models
import '../models/AppState.dart';
//constants
import '../constants.dart';

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
          padding: EdgeInsets.only(left: 700.w, top: 30.h),
          child: IconButton(
            iconSize: 250.sp,
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: AnimatedIcon(
              icon: AnimatedIcons.menu_home,
              progress: _animController1,
              color: !Provider.of<AppState>(context, listen: false).isMenu
                  ? kPrimaryColor
                  : Colors.white,
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
