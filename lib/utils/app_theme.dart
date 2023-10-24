import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerece_c9_sun/utils/my_colors.dart';

class AppTheme {
  static ThemeData mainTheme = ThemeData(
      primaryColor: AppColors.primaryColor,
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.whiteColor,
        ),
        titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: AppColors.whiteColor,
        ),
      ));
}
