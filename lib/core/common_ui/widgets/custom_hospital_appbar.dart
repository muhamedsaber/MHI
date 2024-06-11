import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/main_app_bar.dart';
import 'package:mhi/core/helper/app_assets.dart';

class CustomHospitalAppBar extends StatelessWidget {
  const CustomHospitalAppBar(
      {super.key,
      required this.gradient,
      required this.hospitalImage,
      this.isMainProfile});
  final String hospitalImage;
  final Gradient gradient;
  final bool? isMainProfile;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        MainAppBar(gradient: gradient),
        isMainProfile == true
            ? const SizedBox.shrink()
            : Positioned(
                top: 30.h,
                left: 7.w,
                right: 0.w,
                bottom: 0.h,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, boxShadow: []),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Image.asset(
                        Assets.takeBackIcon,
                        height: 30.h,
                      ),
                    ),
                  ),
                ),
              ),
        Positioned(
          top: 45.h,
          left: 0.w,
          right: 0.w,
          bottom: 0.h,
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: EdgeInsets.all(4.h),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Container(
                padding: EdgeInsets.all(5.h),
                height: 140.h,
                width: 140.w,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      hospitalImage,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}