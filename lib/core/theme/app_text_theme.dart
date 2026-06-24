import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract final class AppTextTheme {
  static const TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'GreatVibes',
      fontSize: 82,
      color: AppColors.mutedBrown,
      height: 1,
    ),

    displayMedium: TextStyle(
      fontFamily: 'GreatVibes',
      fontSize: 64,
      color: AppColors.goldDark,
      height: 1,
    ),

    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: AppColors.charcoal,
      letterSpacing: 1.5,
    ),

    bodyLarge: TextStyle(
      fontSize: 18,
      color: AppColors.charcoal,
      height: 1.8,
    ),

    bodyMedium: TextStyle(
      fontSize: 14,
      color: AppColors.mutedBrown,
      height: 1.6,
    ),
    labelMedium: TextStyle(
      fontSize: 15,
      height: 1.6,
      color: AppColors.mutedBrown
    ),
    labelLarge: TextStyle(
      fontSize: 16,
      letterSpacing: 3,
      color: AppColors.goldDark,
    ),
  );
}