import 'package:flutter/material.dart';
import 'package:mhi/config/Theme/theme_colors.dart';

extension CustomLightThemeColors on ThemeData {
  Color shimmerBaseColor() {
    if (brightness == Brightness.light) {
      return LightThemeColors.shimmer1;
    }else{
      return DarkThemeColors.shimmer1;
    }
  }
  Color shimmerHighlghtColor(){
    if (brightness == Brightness.light) {
      return LightThemeColors.shimmer2;
    }else{
      return DarkThemeColors.shimmer2;
    }
  }
}