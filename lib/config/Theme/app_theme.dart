import 'package:flutter/material.dart';
import 'package:mhi/config/Theme/theme_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: LightThemeColors.lightGreen,
    splashColor: LightThemeColors.lightGreen,
    colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: LightThemeColors.lightGreen,
        onPrimary: LightThemeColors.onPrimaryColor,
        secondary: LightThemeColors.secondaryColor,
        onSecondary: LightThemeColors.onSecondaryColor,
        error: LightThemeColors.errorColor,
        onError: LightThemeColors.onErrorColor,
        surface: Colors.white,
        onSurface: LightThemeColors.onSecondaryColor,
        primaryContainer: LightThemeColors.onSecondaryColor,
        inversePrimary: Colors.black),
    bottomSheetTheme: const BottomSheetThemeData(
        modalBackgroundColor: LightThemeColors.background),
    scaffoldBackgroundColor: LightThemeColors.sliverWhite2,
    appBarTheme: const AppBarTheme(
      backgroundColor: LightThemeColors.sliverWhite2,
      elevation: 0,
      iconTheme: IconThemeData(
        color: LightThemeColors.lighBlue,
      ),
    ),
  );
}
