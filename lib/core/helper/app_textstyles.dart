import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/constants/app_constants.dart';

class AppTextStyles {
  static TextStyle jannat18BoldOnPrimary(BuildContext context) {
    return TextStyle(
        fontFamily: AppConstants.jannatFont,
        fontWeight: FontWeight.bold,
        fontSize: 18.sp,
        color: Theme.of(context).colorScheme.onPrimary);
  }

  static TextStyle jannat18BoldPrimaryColor(BuildContext context) {
    return TextStyle(
        fontFamily: AppConstants.jannatFont,
        fontWeight: FontWeight.bold,
        fontSize: 18.sp,
        color: Theme.of(context).primaryColor);
  }

  static TextStyle jannat21BoldOnPrimary(BuildContext context) {
    return TextStyle(
      fontFamily: AppConstants.jannatFont,
      fontWeight: FontWeight.bold,
      fontSize: 21.sp,
      color: Theme.of(context).colorScheme.onPrimary,
    );
  }

  static TextStyle jannat21BoldPrimaryColor(BuildContext context) {
    return TextStyle(
        fontFamily: AppConstants.jannatFont,
        fontWeight: FontWeight.bold,
        fontSize: 21.sp,
        color: Theme.of(context).primaryColor);
  }

  static TextStyle jannat24ExtraBoldOnPrimary(BuildContext context) {
    return TextStyle(
        fontFamily: AppConstants.jannatBoldFont,
        fontWeight: FontWeight.w900,
        fontSize: 24.sp,
        color: Theme.of(context).colorScheme.onPrimary);
  }

  static TextStyle jannat24ExtraBoldPrimaryColor(BuildContext context) {
    return TextStyle(
        fontFamily: AppConstants.jannatBoldFont,
        fontWeight: FontWeight.w900,
        fontSize: 24.sp,
        color: Theme.of(context).primaryColor);
  }

  static TextStyle jannat18ExtraBoldOnPrimary(BuildContext context) {
    return TextStyle(
        fontFamily: AppConstants.jannatBoldFont,
        fontWeight: FontWeight.w900,
        fontSize: 18.sp,
        color: Theme.of(context).colorScheme.onPrimary);
  }
}