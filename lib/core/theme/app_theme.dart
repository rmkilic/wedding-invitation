import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_text_theme.dart';

abstract final class AppTheme {
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.warmCream,
        textTheme: AppTextTheme.textTheme,
        colorScheme: const ColorScheme.light(
          primary: AppColors.gold,
          secondary: AppColors.deepRose,
          surface: AppColors.warmCream,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: AppColors.charcoal,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          elevation: 0,
        ),
      );
}