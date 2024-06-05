import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppPadding {
  // Responsive padding values using flutter_screenutil
  static double paddingSmall = 8.w;
  static double paddingMedium = 16.w;
  static double paddingLarge = 24.w;
  static double paddingExtraLarge = 32.w;

  // EdgeInsets constants for standard paddings
  static EdgeInsets allSmall = EdgeInsets.all(paddingSmall);
  static EdgeInsets allMedium = EdgeInsets.all(paddingMedium);
  static EdgeInsets allLarge = EdgeInsets.all(paddingLarge);
  static EdgeInsets allExtraLarge = EdgeInsets.all(paddingExtraLarge);

  static EdgeInsets symmetricHorizontalSmall =
      EdgeInsets.symmetric(horizontal: paddingSmall);
  static EdgeInsets symmetricHorizontalMedium =
      EdgeInsets.symmetric(horizontal: paddingMedium);
  static EdgeInsets symmetricHorizontalLarge =
      EdgeInsets.symmetric(horizontal: paddingLarge);
  static EdgeInsets symmetricHorizontalExtraLarge =
      EdgeInsets.symmetric(horizontal: paddingExtraLarge);

  static EdgeInsets symmetricVerticalSmall =
      EdgeInsets.symmetric(vertical: paddingSmall);
  static EdgeInsets symmetricVerticalMedium =
      EdgeInsets.symmetric(vertical: paddingMedium);
  static EdgeInsets symmetricVerticalLarge =
      EdgeInsets.symmetric(vertical: paddingLarge);
  static EdgeInsets symmetricVerticalExtraLarge =
      EdgeInsets.symmetric(vertical: paddingExtraLarge);

  static EdgeInsets onlyTopSmall = EdgeInsets.only(top: paddingSmall);
  static EdgeInsets onlyTopMedium = EdgeInsets.only(top: paddingMedium);
  static EdgeInsets onlyTopLarge = EdgeInsets.only(top: paddingLarge);
  static EdgeInsets onlyTopExtraLarge = EdgeInsets.only(top: paddingExtraLarge);

  static EdgeInsets onlyBottomSmall = EdgeInsets.only(bottom: paddingSmall);
  static EdgeInsets onlyBottomMedium = EdgeInsets.only(bottom: paddingMedium);
  static EdgeInsets onlyBottomLarge = EdgeInsets.only(bottom: paddingLarge);
  static EdgeInsets onlyBottomExtraLarge =
      EdgeInsets.only(bottom: paddingExtraLarge);

  static EdgeInsets onlyLeftSmall = EdgeInsets.only(left: paddingSmall);
  static EdgeInsets onlyLeftMedium = EdgeInsets.only(left: paddingMedium);
  static EdgeInsets onlyLeftLarge = EdgeInsets.only(left: paddingLarge);
  static EdgeInsets onlyLeftExtraLarge =
      EdgeInsets.only(left: paddingExtraLarge);

  static EdgeInsets onlyRightSmall = EdgeInsets.only(right: paddingSmall);
  static EdgeInsets onlyRightMedium = EdgeInsets.only(right: paddingMedium);
  static EdgeInsets onlyRightLarge = EdgeInsets.only(right: paddingLarge);
  static EdgeInsets onlyRightExtraLarge =
      EdgeInsets.only(right: paddingExtraLarge);

  // Additional combinations as needed
  static EdgeInsets symmetricHorizontalVerticalSmall =
      EdgeInsets.symmetric(horizontal: paddingSmall, vertical: paddingSmall);
  static EdgeInsets symmetricHorizontalVerticalMedium =
      EdgeInsets.symmetric(horizontal: paddingMedium, vertical: paddingMedium);
  static EdgeInsets symmetricHorizontalVerticalLarge =
      EdgeInsets.symmetric(horizontal: paddingLarge, vertical: paddingLarge);
  static EdgeInsets symmetricHorizontalVerticalExtraLarge =
      EdgeInsets.symmetric(
          horizontal: paddingExtraLarge, vertical: paddingExtraLarge);

  static EdgeInsets customPadding({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return EdgeInsets.only(
      top: top ?? 0,
      bottom: bottom ?? 0,
      left: left ?? 0,
      right: right ?? 0,
    );
  }
}
