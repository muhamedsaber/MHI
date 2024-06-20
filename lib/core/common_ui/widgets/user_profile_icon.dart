import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/theming.dart';

class UserProfileIcon extends StatelessWidget {
  const UserProfileIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              height: 120.h,
              margin: EdgeInsets.only(left: 30.w, right: 30.w, top: 50),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).cardColor,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 30,
                        spreadRadius: 0,
                        blurStyle: BlurStyle.outer,
                        color: Colors.black.withOpacity(0.2))
                  ]),
              child: Center(
                child: ShaderMask(
                  shaderCallback: (bounds) {
                    return AppThemeing.purpleGreenGradient.createShader(bounds);
                  },
                  child: Icon(
                    Icons.account_circle_sharp,
                    size: 120.h,
                    color: Colors.white,
                  ),
                ),
              ),
            );
  }
}