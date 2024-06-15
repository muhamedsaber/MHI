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
  static TextStyle jannat21BoldOnSurface(BuildContext context){
    return TextStyle(
      fontFamily: AppConstants.jannatFont,
      fontWeight: FontWeight.bold,
      fontSize: 21.sp,
      color: Theme.of(context).colorScheme.onSurface,
    );
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

  static TextStyle jannat24BoldBoldOnPrimary(BuildContext context) {
    return TextStyle(
        fontFamily: AppConstants.jannatFont,
        fontWeight: FontWeight.w900,
        fontSize: 24.sp,
        color: Theme.of(context).colorScheme.onPrimary);
  }

  static TextStyle jannat24BoldPrimaryColor(BuildContext context) {
    return TextStyle(
        fontFamily: AppConstants.jannatFont,
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

  static TextStyle jannat20BoldOnPrimaryColor(BuildContext context) {
    return TextStyle(
        fontFamily: AppConstants.jannatBoldFont,
        fontWeight: FontWeight.w900,
        fontSize: 20.sp,
        color: Theme.of(context).colorScheme.onPrimary);
  }
  

  // 14 onSurface
  static TextStyle jannat14OnSurface(BuildContext context) {
    return TextStyle(
      fontFamily: AppConstants.jannatFont,
      fontSize: 14.sp,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  ///Styles without contexts
  static TextStyle jannat18BoldWhite = TextStyle(
    fontFamily: AppConstants.jannatFont,
    fontWeight: FontWeight.bold,
    fontSize: 18.sp,
    color: Colors.white,
  );
  static TextStyle jannat20BoldWhite = TextStyle(
    fontFamily: AppConstants.jannatFont,
    fontWeight: FontWeight.bold,
    fontSize: 20.sp,
    color: Colors.white,
  );
  static TextStyle jannat18ExtraBoldWhite = TextStyle(
    fontFamily: AppConstants.jannatBoldFont,
    fontWeight: FontWeight.bold,
    fontSize: 18.sp,
    color: Colors.white,
  );
  static TextStyle jannat20ExtraBoldWhite = TextStyle(
    fontFamily: AppConstants.jannatBoldFont,
    fontWeight: FontWeight.bold,
    fontSize: 20.sp,
    color: Colors.white,
  );
  static TextStyle jannat18LightBlue=TextStyle(
    fontFamily: AppConstants.jannatFont,
    fontWeight: FontWeight.bold,
    fontSize: 18.sp,
    color: Colors.lightBlue,
  );
  
}
