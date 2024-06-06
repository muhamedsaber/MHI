import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_assets.dart';
import 'package:mhi/core/helper/extensions.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar(
      {super.key,
      required this.gradient,
      this.widget,
      this.withBackButton = false});
  final Widget? widget;
  final Gradient gradient;
  final bool withBackButton;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding:
              EdgeInsets.only(top: 60.h, left: 20.2, right: 20.w, bottom: 10.h),
          margin: EdgeInsets.only(top: 0.h),
          height: 140.h,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: gradient,
            image: const DecorationImage(
                image: AssetImage(
                  Assets.brillianceEffect,
                ),
                fit: BoxFit.cover,
                opacity: 0.3),
            color: Colors.black,
          ),
        ),
        Positioned(
          top: 100.h,
          left: 0.w,
          right: 0.w,
          bottom: 0.h,
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(7.h),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 10,
                    blurRadius: 30,
                    offset: const Offset(0, -60),
                  ),
                ],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ),
        ),
        withBackButton == true
            ? Positioned(
                top: 30.h,
                left: 15.w,
                child: IconButton(
                    onPressed: () {
                      context.navigateBack();
                    },
                    icon: Image.asset(
                      Assets.takeBackIcon,
                      height: 25.h,
                    )))
            : const SizedBox.shrink(),
        widget ?? const SizedBox.shrink()
      ],
    );
  }
}
