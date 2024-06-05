import 'package:billionworks/consts/color_pallate.dart';
import 'package:billionworks/consts/typography.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    appBarTheme: AppBarTheme(
      centerTitle: false,
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: AppColors.primary,
    ),
    fontFamily: Typo.regular,
    scaffoldBackgroundColor: Colors.white,
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );
}
