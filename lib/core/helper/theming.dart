import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/config/Theme/theme_colors.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/extensions.dart';

class AppThemeing {
  static LinearGradient patientGradient = const LinearGradient(
    colors: [LightThemeColors.lightGreen, LightThemeColors.deepBlue],
  );
  static LinearGradient purpleGreenGradient = const LinearGradient(
    colors: [
      AppColors.lighPurple,
      AppColors.lightGreen,
    ],
  );

  static Container dragHandle(BuildContext context) => Container(
        height: 5.h,
        width: 70.w,
        decoration: BoxDecoration(
          color: context.theme.colorScheme.onSurface,
          borderRadius: BorderRadius.circular(10.r),
        ),
      );
}
