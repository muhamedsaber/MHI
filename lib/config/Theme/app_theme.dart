import 'package:flutter/material.dart';
import 'package:mhi/config/Theme/theme_colors.dart';
import 'package:mhi/core/helper/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.sliverWhite2,
    primaryColor: AppColors.lightGreen,
    splashColor: AppColors.lightGreen,
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.lightGreen,
        onPrimary: Colors.white,
        secondary: Colors.white,
        onSecondary: AppColors.lightGreen,
        error: AppColors.lightRed,
        onError: Colors.white,
        surface: Colors.white,
        onSurface: AppColors.lighBlue,
        primaryContainer: AppColors.lighPurple,
        onPrimaryContainer: Colors.white,
        inversePrimary: Colors.black,
        surfaceContainerHigh: LightThemeColors.shimmer1,
        surfaceContainerLow: LightThemeColors.shimmer2),
    bottomSheetTheme: const BottomSheetThemeData(
        modalBackgroundColor: LightThemeColors.sliverWhite2),
    appBarTheme: const AppBarTheme(
      backgroundColor: LightThemeColors.sliverWhite2,
      elevation: 0,
      iconTheme: IconThemeData(
        color: LightThemeColors.lighBlue,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: DarkThemeColors.scaffoldBackgroundColor,
    primaryColor: DarkThemeColors.primaryColor,
    splashColor: DarkThemeColors.primaryColor,
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.lightGreen,
        onPrimary: Colors.white,
        secondary: DarkThemeColors.secondaryColor,
        onSecondary: AppColors.lightGreen,
        error: AppColors.lightRed,
        onError: Colors.white,
        surface: DarkThemeColors.surface,
        onSurface: DarkThemeColors.primaryColor,
        primaryContainer: AppColors.deepGrey,
        onPrimaryContainer: Colors.white,
        inversePrimary: Colors.black,
        surfaceContainerHigh: DarkThemeColors.shimmer1,
        surfaceContainerLow: DarkThemeColors.shimmer2),
    bottomSheetTheme: const BottomSheetThemeData(
        modalBackgroundColor: LightThemeColors.sliverWhite2),
    appBarTheme: const AppBarTheme(
      backgroundColor: LightThemeColors.sliverWhite2,
      elevation: 0,
      iconTheme: IconThemeData(
        color: LightThemeColors.lighBlue,
      ),
    ),
  );
}
