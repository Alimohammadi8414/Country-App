import 'package:flutter/material.dart';

class AppColors {
  //  Dark Mode Colors
  static Color darkBlue = Color(0xFF2B3945); // Dark Mode Elements
  static Color veryDarkBlueBg = Color(0xFF202C37); // Dark Mode Background
  static Color white = Color(0xFFFFFFFF); // Dark Mode Text

  //  Light Mode Colors
  static Color veryDarkBlueText = Color(0xFF111517); // Light Mode Text
  static Color darkGray = Color(0xFF858585); // Light Mode Input
  static Color veryLightGray = Color(0xFFFAFAFA); // Light Mode Background
  static Color whiteLight = Color(0xFFFFFFFF); // Light Mode Elements
}

// dark theme

ThemeData darkheme = ThemeData(
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(iconColor: AppColors.white),
  ),
  appBarTheme: AppBarTheme(backgroundColor: AppColors.darkBlue),

  dropdownMenuTheme: DropdownMenuThemeData(
    textStyle: TextStyle(color: AppColors.white),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(backgroundColor: AppColors.darkBlue),
  ),
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.veryDarkBlueBg,
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      fontFamily: 'NunitoSans',
      color: AppColors.white,
      fontSize: 16,
    ),
  ),
);

// light theme

ThemeData lighttheme = ThemeData(
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(iconColor: AppColors.veryDarkBlueText),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.whiteLight,
    foregroundColor: AppColors.veryDarkBlueText,
  ),

  dropdownMenuTheme: DropdownMenuThemeData(
    textStyle: TextStyle(color: AppColors.veryDarkBlueText),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(backgroundColor: AppColors.whiteLight),
  ),
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.veryLightGray,
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      fontFamily: 'NunitoSans',
      color: AppColors.veryDarkBlueText,
      fontSize: 16,
    ),
  ),
);
