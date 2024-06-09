import 'package:flutter/material.dart';
import 'package:mhi/core/helper/app_colors.dart';

class LightThemeColors {
  static const Color lightGreen = Color(0xff0CD19E);
  static const Color lighBlue = Color(0xff057ABB);
  static const Color deepBlue = Color(0xff005EB7);
  static const Color deepPurple = Color(0xff282B72);
  static const Color lightWhite = Color(0xffF6F6F6);
  static const Color deepGrey = Color(0xff343434);
  static const Color lightRed = Color(0xffFF3131);
  static const Color sliverWhite = Color(0xffEDF2FB);
  static const Color sliverWhite2 = Color(0xffEEEDF2);
  static const Color lighPurple = Color(0xff757DFF);
  static const Color sliverWhite3 = Color(0xffEDF2FB);
  static const Color lighGrey = Color(0xFFCCCCCC);
  static const Color lightyellow = Color(0xffffcd00);
  static Color shimmer1 = AppColors.lighGrey.withOpacity(0.6);
  static Color shimmer2 = Colors.grey[100]!;
}

class DarkThemeColors {
  static const Color primaryColor = Color(0xff0CD19E);
  static const Color onPrimaryColor = Color(0xff21946D);
  static const Color secondaryColor = Color(0xff0D0D0D);
  static const Color onSecondaryColor = Colors.white;
  static const Color surface = Color(0xff172228);
  static const Color scaffoldBackgroundColor = Color(0xff111111);
  static const Color errorColor = Color(0xffFF3131);
  static const Color onErrorColor = Color(0xffFF5757);
  static const Color surfaceColor = AppColors.sliverWhite2;
  static Color shimmer1 = const Color(0xff2A2A2A).withOpacity(0.6);
  static const Color shimmer2 = Color(0xff444444);
  
}
