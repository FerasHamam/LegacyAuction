import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
//models
import '../models/AppState.dart';

class AppbarButton extends StatefulWidget {
  @override
  _AppbarState createState() => _AppbarState();
}

class _AppbarState extends State<AppbarButton> with TickerProviderStateMixin {
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
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
          color: Colors.transparent,
          height: deviceSize.height * 0.1,
          width: deviceSize.width * 0.3,
          margin: EdgeInsets.only(top: 42.h),
          padding: EdgeInsets.only(right: 300.w),
          child: IconButton(
            padding: EdgeInsets.all(0),
            iconSize: 220.sp,
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: AnimatedIcon(
              icon: AnimatedIcons.menu_home,
              progress: _animController1,
              color: Colors.white,
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
