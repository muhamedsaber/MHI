import 'package:flutter/material.dart';
import 'package:mhi/config/Theme/theme_colors.dart';
import 'package:mhi/core/helper/app_colors.dart';

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
}
